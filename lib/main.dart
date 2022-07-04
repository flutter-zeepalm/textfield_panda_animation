import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive_login/view/landingPage/sandbox.dart';
import 'package:rive_login/view/login/login.dart';

import 'view/landingPage/landing_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Montserrat",
      ),
      home: const Login(),
    );
  }
}
