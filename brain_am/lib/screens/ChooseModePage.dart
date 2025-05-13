import 'package:brain.am/widgets/BigGlassMorphContainer.dart';
import 'package:brain.am/widgets/SmallGlassMorphContainer.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class ChooseModePage extends StatelessWidget {
  const ChooseModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          //backdrop
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BigGlassMorphContainer(text: 'Focus',),

                  Column(
                    children: [
                      SmallGlassMorphContainer(text: 'Chill'),
                      SmallGlassMorphContainer(text: 'Sleep'),
                      SmallGlassMorphContainer(text: 'Study'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}




