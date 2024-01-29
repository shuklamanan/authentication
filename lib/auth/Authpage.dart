import 'package:authentication/pages/Register.dart';
import 'package:authentication/pages/login.dart';
import 'package:flutter/material.dart';

class Authpage extends StatefulWidget {
  const Authpage({super.key});

  @override
  State<Authpage> createState() => _AuthpageState();
}

class _AuthpageState extends State<Authpage> {
  bool showloginpage = true;
  void togglescreens() {
    setState(() {
      showloginpage = !showloginpage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showloginpage) {
      return LoginPage(showregisterpage: togglescreens);
    } else {
      return RegisterPage(showloginpage: togglescreens);
    }
  }
}
