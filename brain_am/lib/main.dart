// import 'package:brain.am/screens/ChooseModePage.dart';
// import 'package:brain.am/screens/LandingPage.dart';
// import 'package:brain.am/screens/PlayerScreenMain.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';


// void main() {
//   runApp(const BrainAMApp());
// }

// class BrainAMApp extends StatelessWidget {
//   const BrainAMApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'Brain AM',
//       debugShowCheckedModeBanner: false,
//       home: const PlayerScreenMain(),
//     );
//   }
// }

import 'package:brain.am/screens/MainScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const BrainAMApp());
}

class BrainAMApp extends StatelessWidget {
  const BrainAMApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Brain AM',
      debugShowCheckedModeBanner: false,
      home: MainScreen(),  // Changed to use our new MainScreen
    );
  }
}