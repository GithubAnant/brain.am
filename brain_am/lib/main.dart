import 'package:brain.am/screens/LandingPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BrainAMApp());
}

class BrainAMApp extends StatelessWidget {
  const BrainAMApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Brain AM',
      debugShowCheckedModeBanner: false,
      home: const BrainAMHome(),
    );
  }
}
