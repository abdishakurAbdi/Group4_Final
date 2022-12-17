import 'package:flutter/material.dart';
import '../client_api.dart';
import './app_bar.dart';
import '../main.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  final ClientApi api = ClientApi();

  @override
  State<LoginPage> createState() => _LoginpageState();
}

class _LoginpageState extends State<LoginPage> {
  final _employeeIdController = TextEditingController();
  final _passwordController = TextEditingController();

  String _message = "";

  void _login() {
    String employeeId = _employeeIdController.text;
    String password = _passwordController.text;

    FocusScope.of(context).unfocus();

    if (employeeId.isEmpty || password.isEmpty) {
      setState(() {
        _message = "Employee ID and Password is required";
      });

      return;
    }

    widget.api.login(employeeId, password).then((value) {
      setState(() {
        if (value == "user logged in sucessfully") {
          Navigator.pop(context);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const RootPage()));
        } else {
          _message = value;
        }
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
          child: Column(
        children: [
          Visibility(
            visible: _message.isNotEmpty,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                _message,
                style: const TextStyle(color: Colors.red),
              ),
            ),
          ),
          const Text("Employee ID:"),
          TextFormField(controller: _employeeIdController),
          const Text("Password"),
          TextFormField(
            controller: _passwordController,
          ),
          ElevatedButton(onPressed: _login, child: const Text("Login")),
          ElevatedButton(
              onPressed: () => widget.api.logout().then((value) {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RootPage()));
                  }),
              child: Text("Logout"))
        ],
      )),
    );
  }
}
