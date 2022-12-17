import 'package:final_project/Models/usedCars.dart';
import 'package:flutter/material.dart';
import '../client_api.dart';
import '../addUsedCar.dart';
import 'app_bar.dart';

class UsedInventory extends StatefulWidget {
  final ClientApi api = ClientApi();

  @override
  State<UsedInventory> createState() => _UsedInventoryState();
}

class _UsedInventoryState extends State<UsedInventory> {
  List usedCars = [];
  bool _dbLoaded = false;

  String _id = "";
  int year = 0;
  String make = "";
  String model = "";
  String miles = "";
  String price = "";

  void initState() {
    super.initState();

    widget.api.getUsedCars().then((data) {
      setState(() {
        usedCars = data;
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
                  child: ListView(
                  shrinkWrap: true,
                  children: [
                    ...usedCars
                        .map<Widget>((usedCars) => (TextButton(
                            onPressed: (() => showDialog(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
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
                              leading: const CircleAvatar(
                                radius: 30,
                                child: Text("USED"),
                              ),
                              title: Text(
                                  usedCars['year'].toString() +
                                      ' \ ' +
                                      usedCars['make'] +
                                      ' \ ' +
                                      ' \ ' +
                                      usedCars['model'],
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              subtitle: Text("Mileage: " + usedCars['miles'],
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              trailing: Text(usedCars['price'],
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      AddUsedCar(_id, year, make, model, miles, price)));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
