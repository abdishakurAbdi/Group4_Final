import 'package:flutter/material.dart';

class Alert extends StatefulWidget {
  final int year;
  final String make;
  final String model;
  final String price;
  const Alert(this.year, this.make, this.model, this.price);

  @override
  State<Alert> createState() => _AlertState(year, make, model, price);
}

class _AlertState extends State<Alert> {
  _AlertState(year, make, model, price);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Thank you for your interest in one of our vehicles"),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, //alert box centered
        children: <Widget>[
          Text("Test"),
        ],
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(); //closes alert box
          },
          child: Text("Close Alert"),
        ),
      ],
    );
  }
}
