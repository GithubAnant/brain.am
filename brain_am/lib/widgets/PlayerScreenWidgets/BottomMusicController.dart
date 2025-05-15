import 'package:brain.am/widgets/PlayerScreenWidgets/MusicButtons.dart';
import 'package:brain.am/widgets/PlayerScreenWidgets/MusicProgressSlider.dart';
import 'package:brain.am/widgets/PlayerScreenWidgets/SliderVolume.dart';
import 'package:brain.am/widgets/PlayerScreenWidgets/SongNameAndSubtext.dart';
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
            SongNameAndSubtext(
              screenWidth: screenWidth,
              screenHeight: screenHeight,
            ),

            AllControllerWidget(
              screenWidth: screenWidth,
              screenHeight: screenHeight,
            ),

            Positioned(
              right: screenWidth * 0.03,
              top: screenHeight * 0.04,
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

            FinalMusicProgressSlider(
              screenHeight: screenHeight,
              screenWidth: screenWidth,
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
//
//

class FinalMusicProgressSlider extends StatelessWidget {
  const FinalMusicProgressSlider({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: screenHeight * 0.025,
      child: Center(
        child: SizedBox(
          width: screenWidth * 0.28,
          child: const MusicProgressSlider(),
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
//

class AllControllerWidget extends StatelessWidget {
  const AllControllerWidget({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: screenWidth * 0.008,
      top: screenHeight * 0.006,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Shuffle(svgPath: 'assets/icons/shuffle.svg'),
          PrevNextButton(svgPath: 'assets/icons/previous.svg'),
          PauseButton(),
          PrevNextButton(svgPath: 'assets/icons/next.svg'),
          Loop(svgPath: 'assets/icons/loop.svg'),
        ],
      ),
    );
  }
}
