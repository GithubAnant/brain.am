import 'package:brain.am/widgets/SliderVolume.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:remixicon/remixicon.dart';

class BottomMusicController extends StatefulWidget {
  const BottomMusicController({super.key});

  @override
  State<BottomMusicController> createState() => _BottomMusicControllerState();
}

class _BottomMusicControllerState extends State<BottomMusicController> {
  double volume = 0.5;

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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Previous
            IconButton(
              icon: SvgPicture.asset(
                'assets/icons/previous.svg',
                width: 27,
                colorFilter: ColorFilter.mode(
                  Colors.white.withAlpha(200),
                  BlendMode.srcIn,
                ),
              ),
              onPressed: () {
                // Previous logic
              },
            ),

            // Pause (square)
            IconButton(
              icon: SvgPicture.asset(
                'assets/icons/pause-circle.svg',
                width: 37,
                colorFilter: ColorFilter.mode(
                  const Color.fromARGB(210, 255, 255, 255),
                  BlendMode.srcIn,
                ),
              ),
              onPressed: () {
                // Pause logic
              },
            ),

            // Next
            IconButton(
              icon: SvgPicture.asset(
                'assets/icons/next.svg',
                width: 27,
                colorFilter: ColorFilter.mode(
                  Colors.white.withAlpha(200),
                  BlendMode.srcIn,
                ),
              ),
              onPressed: () {
                // Next logic
              },
            ),

            // Spacer
            SizedBox(width: MediaQuery.of(context).size.width * 0.3),

            // Volume Icon (speaker-full)
            SvgPicture.asset(
              'assets/icons/speaker-full.svg',
              width: 24,
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),

            // Volume Slider
            VolumeSlider(
              value: volume,
              onChanged: (value) {
                setState(() {
                  volume = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
