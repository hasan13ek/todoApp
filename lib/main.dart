import 'package:first_lesson/screens/ha_chizing.dart';
import 'package:first_lesson/screens/login_page.dart';
import 'package:first_lesson/screens/main_page.dart';
import 'package:first_lesson/screens/register_page.dart';
import 'package:first_lesson/screens/splash_page.dart';
import 'package:first_lesson/screens/onboading_page.dart';
import 'package:first_lesson/screens/start_screen_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}
