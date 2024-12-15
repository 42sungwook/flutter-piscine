import 'package:flutter/material.dart';
import 'package:flutter_piscine/config/theme.dart';
import 'package:flutter_piscine/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '앱 이름',
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}
