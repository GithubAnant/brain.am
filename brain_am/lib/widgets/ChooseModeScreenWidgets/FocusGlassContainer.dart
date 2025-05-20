import 'package:brain.am/controllers/screen_controller.dart';
import 'package:brain.am/screens/PlayerPageContainers/HomeContainer.dart';
import 'package:brain.am/screens/PlayerScreenMain.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:get/get.dart';

class FocusGlassContainer extends StatefulWidget {
  const FocusGlassContainer({super.key, required this.text});

  final String text;

  @override
  State<FocusGlassContainer> createState() => _FocusGlassContainerState();
}

class _FocusGlassContainerState extends State<FocusGlassContainer> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    double baseWidth = MediaQuery.of(context).size.width * 0.3;
    double baseHeight = MediaQuery.of(context).size.height * 0.56;

    return GestureDetector(

      onTap: () {
        // Instead of Get.to(PlayerScreenMain())
        Get.find<ScreenController>().goToPlayer();
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: AnimatedScale(
          duration: const Duration(milliseconds: 300),
          scale: _isHovered ? 1.02 : 1.0,
          child: GlassmorphicContainer(
            margin: const EdgeInsets.only(right: 20, bottom: 20),
            width: baseWidth,
            height: baseHeight,
            borderRadius: 25,
            blur: 0,
            border: 0.3,
            // ← Updated gradients here
            linearGradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors:
                  _isHovered
                      ? [
                        // strong mint → teal → cyan
                        const Color(0xFF1DE9B6).withAlpha(122), // fresh mint
                        const Color(0xFF00BFA5).withAlpha(115), // deep teal
                        const Color(0xFF00E5FF).withAlpha(85), // electric cyan
                      ]
                      : [
                        const Color.fromARGB(255, 204, 204, 204).withAlpha(20),
                        const Color.fromARGB(255, 94, 94, 94).withAlpha(54),
                      ],
              stops: _isHovered ? [0.0, 0.5, 1.0] : null,
            ),

            borderGradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color.fromARGB(255, 210, 210, 210).withAlpha(150),
                const Color.fromARGB(136, 121, 121, 121),
              ],
            ),
            child: Center(
              child: Text(
                widget.text,
                style: const TextStyle(
                  fontSize: 32,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
