import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class CategoryButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool isHovered;

  const CategoryButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    required this.isHovered,
  });

  @override
  Widget build(BuildContext context) {
    double containerWidth = MediaQuery.of(context).size.width * 0.66;
    double containerHeight = MediaQuery.of(context).size.height * 0.8;
    return GestureDetector(
      onTap: onTap,
      child: GlassmorphicContainer(
        width: containerWidth * 0.47,
        height: containerHeight * 0.22,
        borderRadius: 15,
        linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors:
              isHovered
                  ? [
                    const Color.fromARGB(255, 255, 255, 255).withAlpha(50),
                    const Color.fromARGB(255, 255, 255, 255).withAlpha(35),
                  ]
                  : [
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
            const Color.fromARGB(255, 255, 255, 255).withAlpha(180),
            const Color.fromARGB(255, 255, 255, 255).withAlpha(160),
          ],
        ),
        child: Container(
          margin: EdgeInsets.only(left: 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 28, color: Colors.white),
              const SizedBox(height: 12),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
