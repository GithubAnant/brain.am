import 'package:flutter/material.dart';
import 'package:brain.am/constants/globals.dart' as globals;

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
    return ValueListenableBuilder<String>(
      valueListenable: globals.imagePath,
      builder: (context, path, _) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: SizedBox(
            width: containerWidth,
            height: containerHeight,
            child:
                path.isEmpty
                    ? Container(
                      color: Colors.grey[800],
                      child: const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.music_note,
                              color: Colors.white54,
                              size: 80,
                            ),
                            Text(
                              'Click Here Once To Activate',
                              style: TextStyle(
                                fontSize: 50,
                                color: Colors.white54,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    : Image.asset(
                      path,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[800],
                          child: const Center(
                            child: Column(
                              children: [
                                Icon(
                                  Icons.music_note,
                                  color: Colors.white54,
                                  size: 80,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
          ),
        );
      },
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
