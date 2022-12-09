import 'client_api.dart';
import './widgets/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Group 4 Final",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final ClientApi api = ClientApi();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List usedCars = [];

  @override
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
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(75),
          child: AppBar(
              title: Padding(
            padding: const EdgeInsets.all(30.0),
            child:
                Image.asset('images/Group4Logo.png', height: 300, width: 350),
          ))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
                onPressed: () => {
                      print(usedCars),
                    },
                child: const Text("USED CARS")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: const Text("Login"))
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
