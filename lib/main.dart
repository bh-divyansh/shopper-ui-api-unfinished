import 'package:flutter/material.dart';
import 'home-screen.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ),
  );
}
// MaterialApp(
// debugShowCheckedModeBanner: false,
// initialRoute: '/',
// routes: {
// '/': (context) => HomeScreen(),
// },
// )
