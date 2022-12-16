import 'package:flutter/material.dart';
import './app_bar.dart';
import '../client_api.dart';
import '../main.dart';

class NewVehicleForm extends StatefulWidget {
  NewVehicleForm({super.key});

  final ClientApi api = ClientApi();

  @override
  State<NewVehicleForm> createState() => _NewVehicleFormState();
}

class _NewVehicleFormState extends State<NewVehicleForm> {
  final yearController = TextEditingController();
  final makeController = TextEditingController();
  final modelController = TextEditingController();
  final priceController = TextEditingController();
  final milesController = TextEditingController();

  String _groupValue = "New";

  void _addVehicle() {
    String make = makeController.text;
    String model = modelController.text;
    String price = priceController.text;
    String miles = milesController.text;

    int? year = int.tryParse(yearController.text);

    if (year == null) {
      return;
    }

    if (_groupValue == "New") {
      widget.api.addNewCar(year, make, model, price).then((value) {
        setState(() {
          if (value == "New car added to inventory") {
            _toHome();
          }
        });
      });
    } else if (_groupValue == "Used") {
      widget.api.addUsedCar(year, make, model, miles, price).then((value) {
        setState(() {
          if (value == "Used car added to inventory") {
            _toHome();
          }
        });
      });
    }
  }

  void _toHome() {
    Navigator.pop(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const RootPage()));
  }

  void _changeSelectedRadio(String value) {
    setState(() {
      _groupValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(75),
        child: AppBarLogo(),
      ),
      body: Center(
          child: Column(
        children: [
          Row(
            children: [
              Radio(
                value: "New",
                groupValue: _groupValue,
                onChanged: (value) => _changeSelectedRadio(value.toString()),
              ),
              const Text("New"),
              Radio(
                  value: "Used",
                  groupValue: _groupValue,
                  onChanged: (value) => _changeSelectedRadio(value.toString())),
              const Text("used")
            ],
          ),
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
          Visibility(
            visible: _groupValue == "Used",
            child: Column(
              children: [
                const Text("miles:"),
                TextFormField(
                  controller: milesController,
                ),
              ],
            ),
          ),
          const Text("price:"),
          TextFormField(
            controller: priceController,
          ),
          ElevatedButton(
              onPressed: _addVehicle, child: const Text("Add Vehicle"))
        ],
      )),
    );
  }
}
