
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class ModeButtonWidget extends StatelessWidget {
  const ModeButtonWidget({super.key, required this.label, required this.isActive, required this.onTap});

  final String label;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: GlassmorphicContainer(
        width: 120,
        height: 50,
        borderRadius: 25,
        linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            isActive
                ? const Color.fromARGB(255, 90, 123, 221).withAlpha(160)
                : const Color.fromARGB(255, 80, 80, 80).withAlpha(130),
            isActive
                ? const Color.fromARGB(255, 76, 105, 190).withAlpha(130)
                : const Color.fromARGB(255, 60, 60, 60).withAlpha(110),
          ],
        ),
        border: 0.3,
        blur: 0.5,
        borderGradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            isActive
                ? const Color.fromARGB(255, 170, 186, 242)
                : const Color.fromARGB(255, 150, 150, 150),
            isActive
                ? const Color.fromARGB(255, 140, 162, 236)
                : const Color.fromARGB(255, 120, 120, 120),
          ],
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Montserrat',
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}