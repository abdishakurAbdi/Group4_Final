import 'package:flutter/material.dart';
import 'client_api.dart';
import 'widgets/new_inventory.dart';
import 'widgets/used_inventory.dart';
import 'widgets/contact_us.dart';
import 'widgets/app_bar.dart';
import 'widgets/login_page.dart';
import 'widgets/home_page.dart';
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
    List<Widget> pages =  [
      const HomePage(),
      LoginPage(),
      const UsedInventory(),
      const NewInventory(),
      const ContactUs()
    ];
    @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: pages[currentPage],
        bottomNavigationBar: NavigationBar(
      
              destinations: const [
                NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
                NavigationDestination(icon: Icon(Icons.login), label: 'Employee Login'),
                NavigationDestination(icon: Icon(Icons.car_rental_outlined), label: 'New Inventory'),
                NavigationDestination(icon: Icon(Icons.car_rental), label: 'Used Inventory'),
                NavigationDestination(icon: Icon(Icons.document_scanner), label: 'Contact Us'),
                
              ],
              onDestinationSelected: (index) {
                setState(() {
                  currentPage= index;
                });
              }
    ));
  }
}