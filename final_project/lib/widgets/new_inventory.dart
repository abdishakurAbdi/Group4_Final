import 'package:final_project/Models/newCars.dart';
import 'package:flutter/material.dart';
import '../addNewCar.dart';
import '../client_api.dart';
import '../addUsedCar.dart';
import 'app_bar.dart';
import 'alert.dart';

class NewInventory extends StatefulWidget {
  final ClientApi api = ClientApi();

  @override
  State<NewInventory> createState() => _NewInventoryState();
}

class _NewInventoryState extends State<NewInventory> {
  List newCars = [];
  bool _dbLoaded = false;

  void initState() {
    super.initState();

    widget.api.getUsedCars().then((data) {
      setState(() {
        newCars = data;
        _dbLoaded = true;
      });
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
          child: _dbLoaded
              ? Expanded(
                  child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      ...newCars
                          .map<Widget>((newCars) => (TextButton(
                              onPressed: (() => {
                                    Navigator.pop(context),
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: ((BuildContext context) =>
                                                Alert(
                                                  newCars['year'],
                                                  newCars['make'],
                                                  newCars['model'],
                                                  newCars['price'],
                                                ))))
                                  }),
                                  child: ListTile(
                                leading: (Image.asset(
                                    'images/new2022FordBronco.png',
                                    width: 100)),
                                title: Text(
                                    newCars['make'] + ' \ ' + newCars['model'],
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                subtitle: Text(
                                  newCars['price'],
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ))))
                          .toList(),
                    ],
                  ),
                ))
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Text("Loading"),
                    CircularProgressIndicator()
                  ],
                )),
    );
  }
}