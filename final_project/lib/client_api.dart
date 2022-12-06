import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

//this code will need to be modified to handle errors related to status codes.
class ClientApi {
  static const String _url = "http://10.0.2.2:1200";
  final Dio _dio = Dio(BaseOptions(baseUrl: _url));
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future login(String employeeId, String password) async {
    final response = await _dio
        .post('/login', data: {'employeeID': employeeId, 'password': password});

    await _storage.write(
        key: 'accessToken', value: response.data['accessToken']);
  }

  Future addNewCar(int year, String make, String model, String price) async {
    final accessToken = await _storage.read(key: 'accessToken');
    _dio.options.headers['authorization'] = "Bearer $accessToken";

    final response = await _dio.post('/addNewCar',
        data: {'year': year, 'make': make, 'model': model, 'price': price});
  }

  Future addUsedCar(
      int year, String make, String model, String miles, String price) async {
    final accessToken = await _storage.read(key: 'accessToken');
    _dio.options.headers['authorization'] = "Bearer $accessToken";

    await _dio.post('/addUsedCar', data: {
      'year': year,
      'make': make,
      'model': model,
      'miles': miles,
      'price': price
    });
  }

  Future logout() async {
    await _storage.delete(key: 'accessToken');
  }

  Future<List> getNewCars() async {
    final response = await _dio.get('/getNewCars');

    return response.data['newCars'];
  }

  Future<List> getUsedCars() async {
    final response = await _dio.get('/getUsedCars');

    return response.data['usedCars'];
  }

  Future addCustomer(
      String fname, String lname, String email, String phoneNumber) async {
    await _dio.post("addCustomer", data: {
      "fname": fname,
      "lname": lname,
      "email": email,
      "phonenumber": phoneNumber
    });
  }

  Future addEmployee(
      String employeeID, String password, String fname, String lname) async {
    await _dio.post("addEmployee", data: {
      "employeeID": employeeID,
      "password": password,
      "fname": fname,
      "lname": lname
    });
  }
}
