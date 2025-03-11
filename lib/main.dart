// ignore_for_file: prefer_const_constructors

import 'package:car_finance_app/views/showUICarFn.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CarFinaceApp());
}

class CarFinaceApp extends StatefulWidget {
  const CarFinaceApp({super.key});

  @override
  State<CarFinaceApp> createState() => _CarFinaceAppState();
}

class _CarFinaceAppState extends State<CarFinaceApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ShowUICarFn(),
    );
  }
}
