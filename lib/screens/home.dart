import 'package:flutter/material.dart';
import 'package:flutter_piscine/config/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: Padding(
                padding: EdgeInsets.all(AppTheme.spacing2x),
                child: Text(
                  'Welcome to Mobile Piscine',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
            ),
            SizedBox(height: AppTheme.spacing3x),
            ElevatedButton(
              onPressed: () {
                print('Button pressed');
              },
              child: const Text('Button'),
            ),
          ],
        ),
      ),
    );
  }
}
