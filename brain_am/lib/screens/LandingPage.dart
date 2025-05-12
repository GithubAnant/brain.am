import 'package:brain.am/widgets/DemoImage.dart';
import 'package:brain.am/widgets/HeaderText.dart';
import 'package:brain.am/widgets/HeroText.dart';
import 'package:brain.am/widgets/StartListeningButton.dart';
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
          Positioned.fill(child: Container(color: Colors.black.withAlpha(150))),

          Column(
            children: [
              SizedBox(height: 10,),
              Center(
                child: GlassmorphicContainer(
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
                  child: Column(
                    children: [
                      HeaderText(),
              
                      SizedBox(height: 10),
              
                      Row(
                        children: [
                          SizedBox(width: MediaQuery.of(context).size.width * 0.43),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              HeroText(text: "Sounds For \nEverything You Do"),
                              SizedBox(height: 25),
                              StartListeningButton(),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
