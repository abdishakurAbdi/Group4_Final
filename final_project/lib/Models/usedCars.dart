
class UsedCars {
  final String id;
  final int year;
  final String make;
  final String model;
  final String miles;
  final String price;


  UsedCars._(this.id, this.year, this.make, this.model, this.miles, this.price);
  
  factory UsedCars.fromJson(Map json) {
    final id = json[''].replaceAll('ObjectId(\"', '').replaceAll('\")', '');
    final year = json['year'];
    final make = json['make'];
    final model = json['model'];
    final miles = json['miles'];
    final price = json['price'];
    return UsedCars._(id, year, make, model, miles, price);
  }
}