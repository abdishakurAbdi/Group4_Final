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
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Image.asset('images/Group4Logo.png', height: 300, width: 350),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
      ),
    );
  }
}
