import 'package:flutter/material.dart';

class VolumeSlider extends StatefulWidget {
  final double value;
  final ValueChanged<double> onChanged;

  const VolumeSlider({super.key, required this.value, required this.onChanged});

  @override
  State<VolumeSlider> createState() => _VolumeSliderState();
}

class _VolumeSliderState extends State<VolumeSlider> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(
          begin: _isHovered ? 0 : 5,
          end: _isHovered ? 5 : 0,
        ),
        duration: const Duration(milliseconds: 150),
        builder: (context, thumbRadius, child) {
          return SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 1.5,
              thumbShape: RoundSliderThumbShape(
                enabledThumbRadius: thumbRadius,
              ),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 9),
              activeTrackColor:
                  _isHovered
                      ?const Color.fromARGB(255, 255, 220, 188)
                      :  Colors.white,
              inactiveTrackColor: const Color.fromARGB(59, 157, 157, 157),
              thumbColor: Colors.white,
              overlayColor: const Color.fromARGB(255, 0, 0, 0).withAlpha(52),
            ),
            child: Slider(
              value: widget.value,
              min: 0,
              max: 1,
              onChanged: widget.onChanged,
            ),
          );
        },
      ),
    );
  }
}
