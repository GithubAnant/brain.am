import 'package:brain.am/widgets/OptionsSidebar.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:glassmorphism/glassmorphism.dart';

class PlayerScreenMain extends StatefulWidget {
  const PlayerScreenMain({super.key});

  @override
  State<PlayerScreenMain> createState() => _PlayerScreenMainState();
}

class _PlayerScreenMainState extends State<PlayerScreenMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/MusicPhotos/image-15941887.webp',
              fit: BoxFit.cover,
            ),
          ),

          // Glassmorphic sidebar
          OptionsSidebar(),
        ],
      ),
    );
  }
}

