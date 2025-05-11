import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TopLeftLogo extends StatelessWidget {
  const TopLeftLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback:
              (bounds) => LinearGradient(
                colors: [const Color.fromARGB(255, 212, 154, 222), Colors.cyanAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(
                Rect.fromLTWH(0, 0, bounds.width, bounds.height),
              ),
          child: Row(
            children: [
              FaIcon(FontAwesomeIcons.brain, size: 30), // no color here
              SizedBox(width: 6),
              Text(
                'brain.am',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // still needed but masked
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}