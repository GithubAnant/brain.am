import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class BigGlassMorphContainer extends StatefulWidget {
  const BigGlassMorphContainer({super.key, required this.text});

  final String text;

  @override
  State<BigGlassMorphContainer> createState() => _BigGlassMorphContainerState();
}

class _BigGlassMorphContainerState extends State<BigGlassMorphContainer> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    double baseWidth = MediaQuery.of(context).size.width * 0.3;
    double baseHeight = MediaQuery.of(context).size.height * 0.56;

    return GestureDetector(
      onTap: () {},
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
            border: 0.6,
            // ← Updated gradients here
            linearGradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors:
                  _isHovered
                      ? [
                        // strong mint → teal → cyan
                        const Color(0xFF1DE9B6).withOpacity(0.5), // fresh mint
                        const Color(0xFF00BFA5).withOpacity(0.45), // deep teal
                        const Color(
                          0xFF00E5FF,
                        ).withOpacity(0.35), // electric cyan
                      ]
                      : [
                        const Color.fromARGB(255, 132, 132, 132).withAlpha(20),
                        const Color.fromARGB(255, 94, 94, 94).withAlpha(13),
                      ],
              stops: _isHovered ? [0.0, 0.5, 1.0] : null,
            ),

            borderGradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white.withOpacity(0.1), Colors.transparent],
            ),
            child: Center(
              child: Text(
                widget.text,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}