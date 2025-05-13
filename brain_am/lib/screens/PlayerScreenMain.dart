import 'package:flutter/material.dart';

class PlayerScreenMain extends StatefulWidget {
  const PlayerScreenMain({super.key});

  @override
  State<PlayerScreenMain> createState() => _PlayerScreenMainState();
}

class _PlayerScreenMainState extends State<PlayerScreenMain> {

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: Image.asset('assets/images/MusicPhotos/free-photo-of-charming-empty-cobbled-street-at-dusk.jpeg', fit: BoxFit.cover))
        ],
      ),
    );
  }
}