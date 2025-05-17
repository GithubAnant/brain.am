// Neural Effect Button Widget
import 'package:brain.am/screens/PlayerPageContainers/SpecificsContainer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remixicon/remixicon.dart';

class NeuralEffectButton extends StatelessWidget {
  final NeuralEffectLevel level;
  final String label;
  final String description;
  final bool isSelected;
  final VoidCallback onTap;

  const NeuralEffectButton({
    super.key,
    required this.level,
    required this.label,
    required this.description,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.2,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color:
              isSelected
                  ? const Color.fromARGB(255, 55, 46, 114)
                  : const Color.fromARGB(60, 55, 46, 114),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: isSelected ? Colors.deepPurple.shade300 : Colors.transparent,
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon and label row
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Icon(
                    RemixIcons.menu_line,
                    color: isSelected ? Colors.white : Colors.grey,
                    size: 18,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    label,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: isSelected ? Colors.white : Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // Description text
            Text(
              description,
              style: TextStyle(
                fontFamily: 'Lato',
                color: isSelected ? Colors.white70 : Colors.grey,
                fontSize: 12,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
