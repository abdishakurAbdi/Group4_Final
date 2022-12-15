import 'package:final_project/Models/newCars.dart';
import 'package:flutter/material.dart';
import '../addNewCar.dart';
import '../client_api.dart';
import '../addUsedCar.dart';
import 'app_bar.dart';

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
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Image.asset('images/Group4Logo.png', height: 300, width: 350),
        ),
      ),
      body: Center(
          child: _dbLoaded
              ? Expanded(
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
                                          builder: ((context) => AddNewCar(
                                                newCars['_id'],
                                                newCars['year'],
                                                newCars['make'],
                                                newCars['model'],
                                                newCars['price'],
                                              ))))
                                }),
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 30,
                                child: Text(newCars['year'].toString()),
                              ),
                              title: Text(newCars['make'] +
                                  newCars['model'] +
                                  newCars['price']),
                            ))))
                        .toList(),
                  ],
                ))
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Loading"),
                    CircularProgressIndicator()
                  ],
                )),
    );
  }
}
