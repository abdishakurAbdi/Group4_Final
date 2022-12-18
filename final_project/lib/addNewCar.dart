import 'package:final_project/main.dart';
import 'package:final_project/widgets/new_inventory.dart';
import 'package:flutter/material.dart';
import 'client_api.dart';

class AddNewCar extends StatefulWidget {
  final String make, model, price;
  final int year;

  final ClientApi api = ClientApi();

  AddNewCar(this.year, this.make, this.model, this.price, {super.key});
  @override
  State<AddNewCar> createState() => _AddNewCarState(year, make, model, price);
}

class _AddNewCarState extends State<AddNewCar> {
  final String make, model, price;
  final int year;

  _AddNewCarState(this.year, this.make, this.model, this.price);

  void _AddNewCar(year, make, model, price) {
    setState(() {
      widget.api.addNewCar(year, make, model, price);
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: ((context) => MyApp())));
    });
  }

  final yearController = TextEditingController();
  final makeController = TextEditingController();
  final modelController = TextEditingController();
  final priceController = TextEditingController();

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
          children: <Widget>[
            const Text("Year:"),
            TextFormField(
              controller: yearController,
            ),
            const Text("make:"),
            TextFormField(
              controller: makeController,
            ),
            const Text("model:"),
            TextFormField(
              controller: modelController,
            ),
            const Text("price:"),
            TextFormField(
              controller: priceController,
            ),
            ElevatedButton(
                onPressed: (() {
                  _AddNewCar(year, make, model, price);
                }),
                child: const Text("ADD NEW CAR"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.home),
        onPressed: () => {
          Navigator.pop(context),
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const MyApp()))
        },
      ),
    );
  }
}
