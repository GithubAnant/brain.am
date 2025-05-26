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
        Get.find<ScreenController>().goToPlayer();
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: AnimatedScale(
          duration: const Duration(milliseconds: 200),
          scale: _isHovered ? 1.01 : 1.0,
          child: GlassmorphicContainer(
            margin: const EdgeInsets.only(right: 20, bottom: 20),
            width: baseWidth,
            height: baseHeight,
            borderRadius: 25,
            blur: 0,
            border: 0.5,
            // ← Updated gradients here
            linearGradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors:
                  _isHovered
                      ? [
                        const Color(0xFF1A1A1D).withAlpha(22),
                        const Color(0xFF2C2F33).withAlpha(40),
                      ]
                      : [
                        const Color.fromARGB(255, 204, 204, 204).withAlpha(16),
                        const Color.fromARGB(255, 94, 94, 94).withAlpha(34),
                      ],
            ),

            borderGradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              colors: [
                const Color.fromARGB(255, 65, 75, 65).withAlpha(120),
                const Color.fromARGB(112, 53, 53, 53),
              ],
            ),
            child: Center(
              child: Text(
                widget.text,
                style: const TextStyle(
                  color: Color.fromARGB(255, 181, 170, 170),
                  fontSize: 22,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
