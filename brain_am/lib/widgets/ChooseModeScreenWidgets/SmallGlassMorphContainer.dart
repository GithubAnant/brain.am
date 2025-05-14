import 'package:brain.am/controllers/screen_controller.dart';
import 'package:brain.am/screens/PlayerScreenMain.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:brain.am/screens/LandingPage.dart';

class SmallGlassMorphContainer extends StatefulWidget {
  const SmallGlassMorphContainer({
    super.key,
    required this.text,
    required this.startColor,
    required this.endColor,
  });

  final String text;
  final Color startColor;
  final Color endColor;

  @override
  State<SmallGlassMorphContainer> createState() =>
      _SmallGlassMorphContainerState();
}

class _SmallGlassMorphContainerState extends State<SmallGlassMorphContainer> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    double Basewidth = MediaQuery.of(context).size.width * 0.3;
    double Baseheight = MediaQuery.of(context).size.height * 0.17;

    return GestureDetector(
      onTap: () {
        Get.find<ScreenController>().goToPlayer();
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: AnimatedScale(
          duration: Duration(milliseconds: 200),
          scale: _isHovered ? 1.02 : 1.0,
          child: GlassmorphicContainer(
            width: Basewidth,
            height: Baseheight,
            margin: const EdgeInsets.only(bottom: 20),
            borderRadius: 25,
            blur: 0,
            border: 0.6,
            linearGradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors:
                  _isHovered
                      ? [widget.startColor, widget.endColor]
                      : [
                        const Color.fromARGB(
                          255,
                          204,
                          204,
                          204,
                        ).withAlpha(16),
                        const Color.fromARGB(255, 94, 94, 94).withAlpha(34),
                      ],
            ),
            borderGradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color.fromARGB(255, 210, 210, 210).withAlpha(150),
                const Color.fromARGB(213, 121, 121, 121),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: Text(
                  widget.text,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
