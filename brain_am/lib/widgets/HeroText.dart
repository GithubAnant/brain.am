
import 'package:flutter/material.dart';

class HeroText extends StatelessWidget {
  const HeroText({super.key});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return const RadialGradient(
          center: Alignment.topLeft,
          radius: 2,
          colors: [Colors.white, Color.fromARGB(217, 114, 114, 114)],
        ).createShader(bounds);
      },
      child: Text(
        'Sounds for\neverything',
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.width*0.05,
          fontWeight: FontWeight.bold,
          color: Colors.white,
           shadows: [
            Shadow(
              offset: Offset(2.0, 2.0),
              blurRadius: 12.0,
              color: Colors.black.withAlpha(64),
            ),
          ],
        ),
      ),
    );
  }
}