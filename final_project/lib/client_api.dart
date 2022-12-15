import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const String _url = "http://10.0.2.2:1200";

//this code will need to be modified to handle errors related to status codes.
class ClientApi {
  final Dio _dio = Dio(BaseOptions(baseUrl: _url));
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<String> login(String employeeId, String password) async {
    try {
      final response = await _dio.post('/login',
          data: {'employeeID': employeeId, 'password': password});

      await _storage.write(
          key: 'accessToken', value: response.data['accessToken']);
    } on DioError catch (e) {
      return e.response?.data['message'];
    }

    return "user logged in sucessfully";
  }

  Future<String> addNewCar(
      int year, String make, String model, String price) async {
    final accessToken = await _storage.read(key: 'accessToken');
    _dio.options.headers['authorization'] = "Bearer $accessToken";

    Response response;
    try {
      response = await _dio.post('/addNewCar',
          data: {'year': year, 'make': make, 'model': model, 'price': price});
    } on DioError catch (e) {
      return e.response?.data['message'];
    }

    return response.data['message'];
  }

  Future<String> addUsedCar(
      int year, String make, String model, String miles, String price) async {
    final accessToken = await _storage.read(key: 'accessToken');
    _dio.options.headers['authorization'] = "Bearer $accessToken";

    Response response;
    try {
      response = await _dio.post('/addUsedCar', data: {
        'year': year,
        'make': make,
        'model': model,
        'miles': miles,
        'price': price
      });
    } on DioError catch (e) {
      return e.response?.data['message'];
    }

    return response.data['message'];
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

  Future<String> addEmployee(
      String employeeID, String password, String fname, String lname) async {
    Response response;

    try {
      response = await _dio.post("addEmployee", data: {
        "employeeID": employeeID,
        "password": password,
        "fname": fname,
        "lname": lname
      });
    } on DioError catch (e) {
      return e.response?.data['message'];
    }

    return response.data['message'];
  }

  Future<bool> isUserLoggedIn() async {
    String? token = await _storage.read(key: "accessToken");

    return token != null;
  }
}
