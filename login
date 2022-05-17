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

  // TODO: Future bir fonksiyon oluşturulup email, password ve ngrok linkinin verileri işlenecektir ve json formatına dönüştürülecektir.


  @override
  Widget build(BuildContext context) {
    final ngrokText = ModalRoute.of(context)!.settings.arguments as String;
    // TODO: email ve password bilgilerini alan 2 adet textformfield ve bir adet elevatedbutton oluşturunuz.

  }
}
