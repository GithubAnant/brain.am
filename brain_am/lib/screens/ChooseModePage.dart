import 'package:brain.am/widgets/BigGlassMorphContainer.dart';
import 'package:brain.am/widgets/SmallGlassMorphContainer.dart';
import 'package:brain.am/widgets/SocialLink.dart';
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

          Positioned.fill(child: Container(color: Colors.black.withAlpha(50))),

          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: SocialLink(urlLink: 'https://github.com/GithubAnant')
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BigGlassMorphContainer(text: 'Focus'),

                  Column(
                    children: [
                      // SmallGlassMorphContainer(
                      //   text: 'Chill',
                      //   startColor: const Color(0xFF00C6FF).withOpacity(0.25),
                      //   endColor: const Color(0xFF0072FF).withOpacity(0.15),
                      // ),
                      // SmallGlassMorphContainer(
                      //   text: 'Sleep',
                      //   startColor: const Color(0xFF7F00FF).withOpacity(0.25),
                      //   endColor: const Color(0xFFE100FF).withOpacity(0.15),
                      // ),
                      // SmallGlassMorphContainer(
                      //   text: 'Study',
                      //   startColor: const Color(0xFF00F260).withOpacity(0.25),
                      //   endColor: const Color(0xFF0575E6).withOpacity(0.15),
                      // ),
                      SmallGlassMorphContainer(
                        text: 'Chill',
                        startColor: Color(0xFFFF6B6B).withOpacity(0.3),
                        endColor: Color(0xFFFFE66D).withOpacity(0.2),
                      ),
                      SmallGlassMorphContainer(
                        text: 'Sleep',
                        startColor: Color.fromARGB(
                          255,
                          64,
                          28,
                          142,
                        ).withOpacity(0.3),
                        endColor: Color(0xFF9B51E0).withOpacity(0.2),
                      ),
                      SmallGlassMorphContainer(
                        text: 'Study',
                        startColor: Color(0xFFB8E986).withOpacity(0.3),
                        endColor: Color(0xFF62D2A2).withOpacity(0.2),
                      ),
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
