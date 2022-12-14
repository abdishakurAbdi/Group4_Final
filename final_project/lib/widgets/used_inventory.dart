import 'package:flutter/material.dart';
import '../client_api.dart';
import 'app_bar.dart';

class UsedInventory extends StatefulWidget {
  final ClientApi api = ClientApi();

  @override
  State<UsedInventory> createState() => _UsedInventoryState();
}

class _UsedInventoryState extends State<UsedInventory> {
  List usedCars = [];

  void initState() {
    super.initState();

    widget.api.getUsedCars().then((data) {
      setState(() {
        usedCars = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Image.asset('images/Group4Logo.png', height: 300, width: 350),
        ),
      ),
      body: Center(),
    );
  }
}
