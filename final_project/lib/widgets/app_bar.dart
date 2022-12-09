import 'package:flutter/material.dart';

class AppBarLogo extends StatelessWidget {
  const AppBarLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Padding(
      padding: const EdgeInsets.all(30.0),
      child: Image.asset('images/Group4Logo.png', height: 300, width: 350),
    ));
  }
}
