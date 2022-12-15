import 'package:flutter/material.dart';
import 'client_api.dart';

class AddUsedCar extends StatefulWidget {
  final String id, make, model, miles, price;
  int year;

  final ClientApi api = ClientApi();
  AddUsedCar(this.id, this.year, this.make, this.model, this.miles, this.price);

  @override
  State<AddUsedCar> createState() =>
      _AddUsedCarState(id, year, make, model, miles, price);
}

class _AddUsedCarState extends State<AddUsedCar> {
  final String id, make, model, miles, price;
  final int year;

  _AddUsedCarState(
      this.id, this.year, this.make, this.model, this.miles, this.price);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
