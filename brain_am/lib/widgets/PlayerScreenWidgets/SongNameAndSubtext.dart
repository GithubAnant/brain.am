import 'package:flutter/material.dart';
import 'package:brain.am/constants/globals.dart' as globals;
import 'package:google_fonts/google_fonts.dart';

class SongNameAndSubtext1 extends StatelessWidget {
  const SongNameAndSubtext1({
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
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(6),
            ),
            child: Center(
              // child: Icon(Icons.music_note, size: 20, color: Colors.grey),
              child: Icon(Icons.graphic_eq, size: 22, color: const Color.fromARGB(255, 47, 41, 41)),

            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ValueListenableBuilder<String>(
                valueListenable: globals.songTitle,
                builder:
                    (context, title, _) => Text(
                      title,
                      style: GoogleFonts.urbanist(
                        color: const Color.fromARGB(220, 232, 232, 232),
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
              ),
              ValueListenableBuilder<String>(
                valueListenable: globals.songType,
                builder:
                    (context, type, _) => Text(
                      type,
                      style: GoogleFonts.urbanist(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SongNameAndSubtext2 extends StatelessWidget {
  const SongNameAndSubtext2({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ValueListenableBuilder<String>(
          valueListenable: globals.songTitle,
          builder:
              (context, title, _) => Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
        const SizedBox(height: 3),
        ValueListenableBuilder<String>(
          valueListenable: globals.songType,
          builder:
              (context, type, _) => Text(
                type,
                style: const TextStyle(
                  fontFamily: 'Montserrat',
                  color: Color.fromARGB(121, 255, 255, 255),
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                ),
              ),
        ),
      ],
    );
  }
}
