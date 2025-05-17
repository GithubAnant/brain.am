import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioImageBox extends StatefulWidget {
  const AudioImageBox({
    super.key,
    required this.imagePath,
    required this.description,
    required this.audioPath,
  });

  final String imagePath;
  final String description;
  final String audioPath;

  @override
  State<AudioImageBox> createState() => _AudioImageBoxState();
}

class _AudioImageBoxState extends State<AudioImageBox> {
  bool _isHovered = false;
  late AudioPlayer _audioPlayer;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initAudioPlayer();
  }

  Future<void> _initAudioPlayer() async {
    _audioPlayer = AudioPlayer();
    try {
      await _audioPlayer.setAsset(widget.audioPath);
      setState(() {
        _isInitialized = true;
      });
    } catch (e) {
      debugPrint('Error loading audio file: $e');
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _playAudio() {
    if (_isInitialized) {
      _audioPlayer.play();
    }
  }

  void _stopAudio() {
    if (_isInitialized) {
      _audioPlayer.pause();
      _audioPlayer.seek(Duration.zero);
    }
  }

  @override
  Widget build(BuildContext context) {
    double baseHeight = MediaQuery.of(context).size.height * 0.23;
    double baseWidth = MediaQuery.of(context).size.width * 0.15;
    double scale = _isHovered ? 1.03 : 1.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MouseRegion(
          onEnter: (_) {
            setState(() => _isHovered = true);
            _playAudio();
          },
          onExit: (_) {
            setState(() => _isHovered = false);
            _stopAudio();
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            height: baseHeight * scale,
            width: baseWidth * scale,
            margin: const EdgeInsets.only(left: 20, right: 10, top: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(181, 23, 22, 22).withAlpha(77),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(13),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    widget.imagePath, 
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey,
                        child: const Center(
                          child: Text('Image not found',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    },
                  ),
                  if (_isHovered)
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.volume_up,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25, top: 15),
          child: Text(
            widget.description,
            style: TextStyle(
              color: const Color.fromARGB(255, 255, 233, 208),
              fontSize: MediaQuery.of(context).size.width * 0.012,
              fontFamily: 'Montserrat',
            ),
          ),
        ),
      ],
    );
  }
}