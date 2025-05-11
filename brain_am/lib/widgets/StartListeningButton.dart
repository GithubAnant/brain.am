
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class StartListeningButton extends StatelessWidget {
  const StartListeningButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: GlassmorphicContainer(
        width: 200,
        height: 60,
        borderRadius: 20,
        blur: 20,
        alignment: Alignment.center,
        border: 1,
        linearGradient: LinearGradient(
          colors: [
            Colors.white.withAlpha(51),
            Colors.white.withAlpha(13),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderGradient: LinearGradient(
          colors: [
            Colors.white.withAlpha(77),
            Colors.white.withAlpha(26),
          ],
        ),
        child: Text(
          'Start Listening',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
