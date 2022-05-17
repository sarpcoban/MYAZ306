import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  static const routeName = "/login";

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  // TODO: Öğrencinin yapacağı kısımlar
  Future<Map<String, dynamic>?>? login({email, password, ngrokText}) async {
    if (email != null && password != null && ngrokText != null) {
      var response = await http.Client().post(
          Uri.parse('http://${ngrokText}.ngrok.io/login'),
          headers: <String, String>{'Content-Type': 'application/json'},
          body: jsonEncode(
              {'email': email.toString(), 'password': password.toString()}));
      return jsonDecode(response.body);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final ngrokText = ModalRoute.of(context)!.settings.arguments as String;
    // TODO: Öğrencinin yapacağı kısımlar
    return Scaffold(
      appBar: AppBar(
        title: Text(ngrokText),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(50.0, 0, 50.0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text("Login Form"),
              TextFormField(
                controller: _email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(label: Text("Email")),
              ),
              TextFormField(
                controller: _password,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(label: Text("Password")),
              ),
              ElevatedButton(
                  onPressed: () => login(
                              email: _email.text,
                              password: _password.text,
                              ngrokText: ngrokText)
                          ?.then((value) {
                        if (value != null) {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/home', (route) => false, arguments: value);
                        }
                      }),
                  child: Text("Enter"))
            ],
          ),
        ),
      ),
    );
  }
}


