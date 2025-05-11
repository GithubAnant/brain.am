import 'package:brain.am/widgets/DemoImage.dart';
import 'package:brain.am/widgets/HeroText.dart';
import 'package:brain.am/widgets/StartListeningButton.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';


class BrainAMHome extends StatelessWidget {
  const BrainAMHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(0, 0, 0, 0),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/images/1.png', fit: BoxFit.cover,),
          ),
          Positioned.fill(child: Container(
            color: Colors.black.withAlpha(150),
          )),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Phone UI Mock
                DemoImage(),
                const SizedBox(width: 60),
                // Right Text Section
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    HeroText(),
                    const SizedBox(height: 30),
                    StartListeningButton(),
                  ],
                ),
                    const SizedBox(width: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


