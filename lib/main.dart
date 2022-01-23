// main.dart
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:get/get.dart';

import 'Pages/home_page.dart';
import 'Route/pages.dart';
import 'Route/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Kindacode.com',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      //home: const HomePage(),
      getPages: Pages.list,
      initialRoute: Pages.intial_page
    );
  }
}

