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
                            onPressed: (() => {
                                  Navigator.pop(context),
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) => AddUsedCar(
                                                usedCars['_id'],
                                                usedCars['year'],
                                                usedCars['make'],
                                                usedCars['model'],
                                                usedCars['miles'],
                                                usedCars['price'],
                                              ))))
                                }),
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 30,
                                child: Text(usedCars['make']),
                              ),
                              title: Text(
                                  usedCars['year'].toString() +
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
    );
  }
}
