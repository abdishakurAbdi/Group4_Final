import 'package:flutter/material.dart';
import 'app_bar.dart';

const int itemCount = 20;

class NewInventory extends StatelessWidget {
  const NewInventory({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text("Item ${(index + 1)}"),);
      }

    );
  }
}