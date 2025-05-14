import 'package:brain.am/screens/LandingPage.dart';
import 'package:brain.am/screens/PlayerPageContainers/HomeContainer.dart';
import 'package:brain.am/widgets/PlayerScreenWidgets/BottomMusicController.dart';
import 'package:brain.am/widgets/PlayerScreenWidgets/OptionsSidebar.dart';
import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'dart:math';

class PlayerScreenMain extends StatefulWidget {
  const PlayerScreenMain({super.key});

  @override
  State<PlayerScreenMain> createState() => _PlayerScreenMainState();
}

class _PlayerScreenMainState extends State<PlayerScreenMain> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent, leading: IconButton(onPressed: (){Get.to(BrainAMHome());}, icon: Icon(Icons.arrow_back, color: Colors.white60,)),),
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
            'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),

          // Glassmorphic sidebar
          OptionsSidebar(),
          HomeContainer(),
          BottomMusicController(),
        ],
      ),
    );
  }
}

