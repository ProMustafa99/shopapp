

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData light = ThemeData(
  primarySwatch: Colors.blue,
  appBarTheme: const AppBarTheme(
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark
      ),
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(
          color: Colors.black ,
          fontSize: 20,
          fontWeight: FontWeight.bold),
      iconTheme: IconThemeData(color: Colors.black ,size: 25),
      elevation: 0.0
  ),
  scaffoldBackgroundColor: Colors.white,
  bottomNavigationBarTheme:BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.deepOrangeAccent,
      elevation: 40.0,
      backgroundColor: Colors.white

  ),
  textTheme:TextTheme
    (
      bodyText1: TextStyle(fontSize: 18, fontWeight: FontWeight.w600 ,color: Colors.black),
      bodyText2: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.blueAccent )

),
);