import 'package:flutter/material.dart';
import 'package:flutter_piscine/config/theme.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Calculator'),
      centerTitle: true,
      elevation: 0,
      backgroundColor: AppTheme.primaryColor,
      titleTextStyle: AppTheme.darkTheme.textTheme.displayLarge,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
