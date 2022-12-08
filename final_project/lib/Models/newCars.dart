
class NewCars {
  final String id;
  final int year;
  final String make;
  final String model;
  final String price;
  NewCars._(this.id, this.year, this.make, this.model, this.price);
  factory NewCars.fromJson(Map json) {
    final id = json[''].replaceAll('ObjectId(\"', '').replaceAll('\")', '');
    final year = json['year'];
    final make = json['make'];
    final model = json['model'];
    final price = json['price'];
    return NewCars._(id, year, make, model, price);
  }
}