import 'package:brain.am/screens/PlayerScreenMain.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:remixicon/remixicon.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: MediaQuery.of(context).size.width * 0.2,
      top: MediaQuery.of(context).size.height * 0.08,
      child: GlassmorphicContainer(
        width: MediaQuery.of(context).size.width * 0.6,
        height: MediaQuery.of(context).size.height * 0.8,
        borderRadius: 15,
        linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color.fromARGB(255, 255, 255, 255).withAlpha(20),
            const Color.fromARGB(255, 255, 255, 255).withAlpha(13),
          ],  
        ),
        border: 0.3,
        blur: 10,
        borderGradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color.fromARGB(255, 255, 255, 255),
            const Color.fromARGB(210, 255, 255, 255),
          ],
        ),
      ),
    );
  }
}

