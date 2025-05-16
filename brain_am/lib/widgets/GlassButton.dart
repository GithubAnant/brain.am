import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class GlassButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const GlassButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      width: 60,
      height: 60,
      borderRadius: 40,
      linearGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          const Color.fromARGB(255, 255, 255, 255).withAlpha(30),
          const Color.fromARGB(255, 255, 255, 255).withAlpha(20),
        ],
      ),
      border: 0.3,
      blur: 0.5,
      borderGradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color.fromARGB(255, 201, 201, 201),
          const Color.fromARGB(210, 194, 194, 194),
        ],
      ),
      child: Center(
        child: IconButton(
          icon: Icon(icon, color: Colors.white, size: 32),
          onPressed: onTap,
        ),
      ),
    );
  }
}
