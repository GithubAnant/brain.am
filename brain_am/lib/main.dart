import 'package:brain_am/screens/LandingPage.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(BrainAM());
}

class BrainAM extends StatelessWidget {
  const BrainAM({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
    );
  }
}