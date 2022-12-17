import 'package:final_project/Models/newCars.dart';
import 'package:final_project/widgets/vehicle_form.dart';
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
                              onPressed: (() => showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                        title: const Text("WELCOME"),
                                        content: SingleChildScrollView(
                                          child: ListBody(
                                            children: const <Widget>[
                                              Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Text(
                                                    "If you are interested and want to test drive this BEAUTY we welcome you to our dealership ",
                                                    style: const TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Text(
                                                    "Our Address:  1987  RICKROLL LANE, ASTLEY MN, 55245",
                                                    style: const TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                              Text("Phone No: (320) 867-5309",
                                                  style: const TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold))
                                            ],
                                          ),
                                        ),
                                      ))),
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: 30,
                                  child: Text("NEW"),
                                ),
                                title: Text(
                                    newCars['year'].toString() +
                                        newCars['make'] +
                                        ' \ ' +
                                        newCars['model'],
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => VehicleForm()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
