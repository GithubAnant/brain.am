import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:brain.am/services/music_player_service.dart';

class MusicProgressSlider extends StatefulWidget {
  const MusicProgressSlider({super.key});

  @override
  State<MusicProgressSlider> createState() => _MusicProgressSliderState();
}

class _MusicProgressSliderState extends State<MusicProgressSlider> {
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  StreamSubscription? _durationSubscription;
  StreamSubscription? _positionSubscription;
  bool _isDragging = false;
  bool _isHovering = false;
  final MusicPlayerService _musicService = MusicPlayerService();

  @override
  void initState() {
    super.initState();
    _setupAudioListeners();
  }

  void _setupAudioListeners() {
    _durationSubscription = _musicService.audioPlayer.onDurationChanged.listen((Duration d) {
      setState(() {
        duration = d;
      });
    });

    _positionSubscription = _musicService.audioPlayer.onPositionChanged.listen((Duration p) {
      if (!_isDragging) {
        setState(() {
          position = p;
        });
      }
    });

    // Handle song completion
    _musicService.audioPlayer.onPlayerComplete.listen((_) {
      if (_musicService.isLoop) {
        _musicService.playCurrentSong();
      } else {
        _musicService.nextSong();
      }
    });
  }

  @override
  void dispose() {
    _durationSubscription?.cancel();
    _positionSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double value =
        duration.inMilliseconds == 0
            ? 0
            : position.inMilliseconds / duration.inMilliseconds;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child: SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 1.5,
            activeTrackColor:
                _isHovering
                    ? const Color.fromARGB(255, 0, 224, 22)
                    : Colors.white,
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 8),
            inactiveTrackColor: const Color.fromARGB(59, 157, 157, 157),
            thumbColor: _isHovering ? Colors.white : Colors.transparent,
            overlayColor: Colors.black.withAlpha(52),
            thumbShape: RoundSliderThumbShape(
              enabledThumbRadius: _isHovering ? 4.0 : 0.0,
            ),
          ),
          child: Slider(
            value: value.clamp(0.0, 1.0),
            min: 0,
            max: 1,
            onChanged: (newValue) {
              setState(() {
                _isDragging = true;
                position = Duration(
                  milliseconds: (newValue * duration.inMilliseconds).round(),
                );
              });
            },
            onChangeEnd: (newValue) {
              setState(() {
                _isDragging = false;
              });
              _musicService.audioPlayer.seek(position);
            },
          ),
        ),
      ),
    );
  }
}