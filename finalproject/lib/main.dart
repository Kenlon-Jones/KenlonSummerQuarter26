import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const PeakPulseApp());
}

class PeakPulseApp extends StatelessWidget {
  const PeakPulseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PeakPulse',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6E657E)),
        useMaterial3: true,
      ),
      home: const HomePage(
        userName: 'User',
        email: 'user@example.com',
      ),
    );
  }
}