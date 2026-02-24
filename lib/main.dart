import 'package:flutter/material.dart';
import 'package:flutter_6/home_screen.dart';
import 'package:flutter_6/plan_your_intercity_trip.dart';
import 'package:flutter_6/plan_your_ride.dart';
import 'package:flutter_6/searchpagewithtwofields.dart';

import 'package:flutter_6/splash.dart';
import 'package:flutter_6/uber_account_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
