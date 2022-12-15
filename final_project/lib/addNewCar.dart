import 'package:flutter/material.dart';
import 'client_api.dart';

class AddNewCar extends StatefulWidget {
  final String _id, make, model, price;
  final int year;

  final ClientApi api = ClientApi();

  AddNewCar(this._id, this.year, this.make, this.model, this.price);

  @override
  State<AddNewCar> createState() =>
      _AddNewCarState(_id, year, make, model, price);
}

class _AddNewCarState extends State<AddNewCar> {
  final String _id, make, model, price;
  final int year;

  _AddNewCarState(this._id, this.year, this.make, this.model, this.price);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Hahahahahahahahah'),
    );
  }
}
