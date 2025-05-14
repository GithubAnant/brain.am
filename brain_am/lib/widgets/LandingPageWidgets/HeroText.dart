
import 'package:flutter/material.dart';

class HeroText extends StatelessWidget {
  const HeroText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return const RadialGradient(
          center: Alignment.center,
          radius: 2,
          colors: [Color.fromARGB(255, 255, 230, 172), Color.fromRGBO(255, 195, 152, 0.758)],
        ).createShader(bounds);
      },
      child: Text(
        text,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontFamily: 'Lato',
          fontSize: MediaQuery.of(context).size.width*0.034,
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
