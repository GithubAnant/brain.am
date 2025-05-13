import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class SmallGlassMorphContainer extends StatelessWidget {
  const SmallGlassMorphContainer({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      width: MediaQuery.of(context).size.width * 0.3,
      height: MediaQuery.of(context).size.height * 0.17,
      margin: EdgeInsets.only(bottom: 20),
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

      child: Text(text, style: TextStyle(color: Colors.white)),
    );
  }
}
