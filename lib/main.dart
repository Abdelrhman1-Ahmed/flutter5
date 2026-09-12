import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const NectarApp());
}

class NectarApp extends StatelessWidget {
  const NectarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nectar - Online Grocery',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}