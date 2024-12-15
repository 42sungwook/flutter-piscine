// lib/screens/home.dart
import 'package:flutter/material.dart';
import 'package:flutter_piscine/widgets/calculator.dart';
import 'package:flutter_piscine/widgets/common/app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: CalculatorWidget(),
    );
  }
}