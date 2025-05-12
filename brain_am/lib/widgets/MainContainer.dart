import 'package:brain.am/screens/LandingPage.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class MainContainer extends StatelessWidget {
  const MainContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.9,
      borderRadius: 25,
      linearGradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.topRight,
        colors: [
          const Color.fromARGB(255, 132, 132, 132).withAlpha(20),
          const Color.fromARGB(255, 94, 94, 94).withAlpha(13),
        ],
      ),
      border: 0.6,
      blur: 0,
      borderGradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color.fromARGB(255, 175, 175, 175).withAlpha(77),
          const Color.fromARGB(0, 0, 0, 0).withAlpha(26),
        ],
      ),

      child: MainContainerContent(),
    );
  }
}
