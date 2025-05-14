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
            // Conditionally set thumbColor. When not hovering and radius is 0,
            // make it transparent to ensure it's not visible.
            thumbColor: _isHovering ? Colors.white : Colors.transparent,
            overlayColor: Colors.black.withAlpha(52),
            // Modify thumbShape to change radius on hover
            thumbShape: RoundSliderThumbShape(
              enabledThumbRadius: _isHovering ? 4.0 : 0.0,
              // Optional: Adjust elevation if it creates unwanted effects with 0 radius
              // pressedElevation: _isHovering ? 6.0 : 0.0, // Default is 6.0
              // elevation: _isHovering ? 1.0 : 0.0, // Default is 1.0
            ),
          ),
          child: Slider(
            value: value.clamp(0.0, 1.0), // Ensure value is within 0.0 and 1.0
            min: 0,
            max: 1,
            onChanged: (newValue) {
              setState(() {
                _isDragging = true;
                // Assuming 'value' should also be updated to reflect the slider's visual state
                // If 'value' is the primary source of truth for the slider's position, update it:
                // value = newValue; // Uncomment if 'value' drives the slider position directly
                position = Duration(
                  milliseconds: (newValue * duration.inMilliseconds).round(),
                );
              });
            },
            onChangeEnd: (newValue) {
              setState(() {
                _isDragging = false;
                // If you also need to update 'value' on onChangeEnd:
                // value = newValue; // Uncomment if needed
                // And potentially update 'position' again if 'value' is the source
                // position = Duration(
                //   milliseconds: (newValue * duration.inMilliseconds).round(),
                // );
              });
            },
          ),
        ),
      ),
    );
  }
}
