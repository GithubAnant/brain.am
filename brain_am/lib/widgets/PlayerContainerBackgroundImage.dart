import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    super.key,
    required this.containerWidth,
    required this.containerHeight,
  });

  final double containerWidth;
  final double containerHeight;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: SizedBox(
        width: containerWidth,
        height: containerHeight,
        child: Image.asset(
  'assets/images/MusicPhotos1/LyKTuqo.jpg',
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey[800],
              child: const Center(
                child: Icon(Icons.music_note, color: Colors.white54, size: 80),
              ),
            );
          },
        ),
      ),
    );
  }
}

class BlackTint extends StatelessWidget {
  const BlackTint({
    super.key,
    required this.containerWidth,
    required this.containerHeight,
  });

  final double containerWidth;
  final double containerHeight;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: containerWidth,
        height: containerHeight,
        color: Colors.black.withAlpha(154), // smoother control
      ),
    );
  }
}