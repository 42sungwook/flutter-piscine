import 'package:flutter/material.dart';
import 'package:flutter_piscine/config/theme.dart';
import 'package:flutter_piscine/widgets/common/app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const String _welcomeText = 'Welcome to Mobile Piscine';
  static const String _helloText = 'Hello World!';

  bool _isWelcomeText = true;

  void _toggleText() {
    setState(() {
      _isWelcomeText = !_isWelcomeText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: Padding(
                padding: EdgeInsets.all(AppTheme.spacing2x),
                child: Text(
                  _isWelcomeText ? _welcomeText : _helloText,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
            ),
            SizedBox(height: AppTheme.spacing3x),
            ElevatedButton(
              onPressed: _toggleText,
              child: const Text('Button'),
            ),
          ],
        ),
      ),
    );
  }
}
