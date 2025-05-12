import 'package:brain.am/widgets/DemoImage.dart';
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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.03,
                        vertical: MediaQuery.of(context).size.height * 0.019,
                      ),
                      child: Text(
                        'brain.am',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                          letterSpacing: 0.5, // adds spaciousness
                          color: const Color.fromARGB(255, 255, 230, 202),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 10),

                  Row(
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width * 0.43),
                      Column(
                        children: [
                          HeroText(text: "Sounds For \nEverything You Do"),
                          SizedBox(height: 25),
                          Align(
                            alignment: Alignment.center,
                            child: StartListeningButton(),
                          ),
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
    );
  }
}
