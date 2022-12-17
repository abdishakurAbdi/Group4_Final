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
      title: const Text("WELCOME"),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(
                "If you are interest and want to test drive this BEAUTY we welcome you to our dealership "),
            Text("Our Address:  1987  RICKROLL LANE, ASTLEY MN, 55245"),
            Text("Phone No: (320) 867-5309")
          ],
        ),
      ),
    );
  }
}
