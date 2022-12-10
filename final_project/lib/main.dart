import 'package:flutter/material.dart';
import 'client_api.dart';
 
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange
      ),
      home: const RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override 
  State<RootPage> createState() => _RootPageState();
}
 
  class _RootPageState extends State<RootPage> {
    int currentPage = 0;
    @override 
    Widget build(BuildContext context) {
      return Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage (
            image: AssetImage ('images\Group4Logo.png'),
            fit: BoxFit.cover),),
            child: Scaffold(
          
        
            appBar: AppBar(
              title: const Text('Flutter'),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
              debugPrint('Floating Action Button');
            },
            child: const Icon(Icons.add),
            ),
            bottomNavigationBar: NavigationBar(
              destinations: const [
                NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
                NavigationDestination(icon: Icon(Icons.car_rental), label: 'Inventory'),
                NavigationDestination(icon: Icon(Icons.document_scanner), label: 'Contact Us'),
              ],
              onDestinationSelected: (int index) {
                setState(() {
                  currentPage = index;
                });
              },
              selectedIndex: currentPage,
            )
          )
        );
      }
}