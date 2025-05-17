import 'package:brain.am/widgets/LandingPageWidgets/DemoImage.dart';
import 'package:brain.am/widgets/LandingPageWidgets/HeaderText.dart';
import 'package:brain.am/widgets/LandingPageWidgets/HeroText.dart';
import 'package:brain.am/widgets/LandingPageWidgets/MainContainer.dart';
import 'package:brain.am/widgets/SocialLink.dart';
import 'package:brain.am/widgets/LandingPageWidgets/StartListeningButton.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';

class BrainAMHome extends StatelessWidget {
  const BrainAMHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      backgroundColor: const Color.fromARGB(0, 0, 0, 0),
      body: Stack(
        children: [
          //backdrop
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),

          //tint
          Positioned.fill(child: Container(color: Colors.black.withAlpha(50))),

          Positioned(
            bottom: 13,
            left: 0,
            right: 0,
            child: Center(
              // child: SocialLink(urlLink: 'https://github.com/GithubAnant')
            ),
          ),

          Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              Center(child: MainContainer()),
            ],
          ),
        ],
      ),
    );
  }
}
