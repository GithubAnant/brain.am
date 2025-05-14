import 'package:brain.am/screens/PlayerPageContainers/HomeContainer.dart';
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
              'assets/images/MusicPhotos/image-1509582.jpeg',
              fit: BoxFit.cover,
            ),
          ),

          // Glassmorphic sidebar
          OptionsSidebar(),
          HomeContainer(),

          Positioned(
            left: MediaQuery.of(context).size.width * 0.225,
            top: MediaQuery.of(context).size.height * 0.8,
            child: GlassmorphicContainer(
              width: MediaQuery.of(context).size.width * 0.55,
              height: MediaQuery.of(context).size.height * 0.13,
              borderRadius: 55,
              linearGradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color.fromARGB(255, 255, 255, 255).withAlpha(20),
                  const Color.fromARGB(255, 255, 255, 255).withAlpha(13),
                ],
              ),
              border: 0.3,
              blur: 10,
              borderGradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color.fromARGB(255, 255, 255, 255),
                  const Color.fromARGB(210, 255, 255, 255),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
