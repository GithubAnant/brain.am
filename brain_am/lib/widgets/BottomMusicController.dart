import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:remixicon/remixicon.dart';

class BottomMusicController extends StatelessWidget {
  const BottomMusicController({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: MediaQuery.of(context).size.width * 0.21,
      top: MediaQuery.of(context).size.height * 0.8,
      child: GlassmorphicContainer(
        width: MediaQuery.of(context).size.width * 0.6,
        height: MediaQuery.of(context).size.height * 0.13,
        borderRadius: 55,
        linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color.fromARGB(255, 255, 255, 255).withAlpha(20),
            const Color.fromARGB(255, 255, 255, 255).withAlpha(13),
          ],
        ),
        border: 0.3,
        blur: 10,
        borderGradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color.fromARGB(255, 255, 255, 255),
            const Color.fromARGB(210, 255, 255, 255),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Previous
            IconButton(
              icon: FaIcon(RemixIcons.arrow_left_wide_line, color: Colors.white.withAlpha(200), size: 30,),
              iconSize: 30,
              onPressed: () {
                // Previous logic
              },
            ),

            // Pause
            IconButton(
              icon: Icon(RemixIcons.pause_line, size: 35, color: Colors.white,),
              iconSize: 40,
              onPressed: () {
                // Pause logic
              },
            ),

            // Next
            IconButton(
              icon: FaIcon(RemixIcons.play_reverse_line, color: Colors.white.withAlpha(200), size: 30,),
              iconSize: 30,
              onPressed: () {
                // Previous logic
              },
            ),

            // Spacer
            SizedBox(width: 30),

            // Volume Icon
            Icon(Icons.volume_up, size: 24),

            // Volume Slider
            Slider(
              value: 0.5,
              onChanged: (value) {
                // Update volume logic
              },
              min: 0,
              max: 1,
            ),
          ],
        ),
      ),
    );
  }
}
