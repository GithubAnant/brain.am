import 'package:brain.am/widgets/PlayerScreenWidgets/MusicProgressSlider.dart';
import 'package:brain.am/widgets/PlayerScreenWidgets/SliderVolume.dart';
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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Positioned(
      left: screenWidth * 0.21,
      top: screenHeight * 0.8,
      child: GlassmorphicContainer(
        width: screenWidth * 0.6,
        height: screenHeight * 0.13,
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

        child: Stack(
          children: [
            // Song info - left side
            SongNameAndSubtext(screenWidth: screenWidth, screenHeight: screenHeight),

            Positioned(
              left: 0,
              right: screenWidth * 0.008,
              top: screenHeight * 0.006,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PrevNextButton(svgPath: 'assets/icons/previous.svg'),
                  PauseButton(),
                  PrevNextButton(svgPath: 'assets/icons/next.svg'),
                ],
              ),
            ),

            Positioned(
              right: screenWidth * 0.03,
              top: screenHeight * 0.026,
              child: Row(
                children: [
                  const SpeakerButton(),
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

            Positioned(
              left: 0,
              right: 0,
              bottom: screenHeight * 0.025,
              child: Center(
                child: SizedBox(
                  width: screenWidth * 0.28,
                  child: const MusicProgressSlider(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//
//
//
//
//
//
//
//
//
//

class SongNameAndSubtext extends StatelessWidget {
  const SongNameAndSubtext({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: screenWidth * 0.025,
      top: screenHeight * 0.04,
      child: Row(
        children: [
          // Album art
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Center(
              child: Icon(
                Icons.music_note,
                size: 20,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "SemiColon",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "Post-Rock",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//
//
//
//
//
//
//
//
//
//

class SpeakerButton extends StatelessWidget {
  const SpeakerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/speaker-full.svg',
      width: 16,
      colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
    );
  }
}

//
//
//
//
//
//
//
//
//s
//

class PauseButton extends StatelessWidget {
  const PauseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: SvgPicture.asset(
        'assets/icons/pause-circle.svg',
        width: 45,
        colorFilter: ColorFilter.mode(
          const Color.fromARGB(210, 255, 255, 255),
          BlendMode.srcIn,
        ),
      ),
      onPressed: () {},
    );
  }
}

//
//
//
//
//
//
//
//
//
//

class PrevNextButton extends StatelessWidget {
  const PrevNextButton({super.key, required this.svgPath});

  final String svgPath;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: SvgPicture.asset(
        svgPath,
        width: 25,
        colorFilter: ColorFilter.mode(
          Colors.white.withAlpha(200),
          BlendMode.srcIn,
        ),
      ),
      onPressed: () {},
    );
  }
}
