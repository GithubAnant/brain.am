import 'dart:async';

import 'package:flutter/material.dart';

class MusicProgressSlider extends StatefulWidget {
  const MusicProgressSlider({super.key});

  @override
  State<MusicProgressSlider> createState() => _MusicProgressSliderState();
}

class _MusicProgressSliderState extends State<MusicProgressSlider> {
  Duration duration = const Duration(seconds: 120); // 2 minutes
  Duration position = Duration.zero;
  Timer? _timer;
  bool _isDragging = false;
  bool _isHovering = false;

  @override
  void initState() {
    super.initState();
    _startFakeAudioProgress();
  }

  void _startFakeAudioProgress() {
    _timer = Timer.periodic(const Duration(milliseconds: 500), (_) {
      if (!_isDragging && position < duration) {
        setState(() {
          position += const Duration(milliseconds: 500);
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double value = duration.inMilliseconds == 0
        ? 0
        : position.inMilliseconds / duration.inMilliseconds;

    final activeColor =
        (_isHovering || _isDragging) ? const Color(0xFFFFDCBC) : Colors.white;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child: SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 1.5,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 4),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 8),
            activeTrackColor: activeColor,
            inactiveTrackColor: const Color.fromARGB(59, 157, 157, 157),
            thumbColor: Colors.white,
            overlayColor: Colors.black.withAlpha(52),
          ),
          child: Slider(
            value: value.clamp(0.0, 1.0),
            min: 0,
            max: 1,
            onChanged: (newValue) {
              setState(() {
                _isDragging = true;
                position = Duration(
                  milliseconds: (newValue * duration.inMilliseconds).toInt(),
                );
              });
            },
            onChangeEnd: (newValue) {
              setState(() {
                _isDragging = false;
              });
            },
          ),
        ),
      ),
    );
  }
}
