
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class ModeButtonWidget extends StatefulWidget {
  const ModeButtonWidget({super.key, required this.label, required this.isActive, required this.onTap});

  final String label;
  final bool isActive;
  final VoidCallback onTap;

  @override
  State<ModeButtonWidget> createState() => _ModeButtonWidgetState();
}

class _ModeButtonWidgetState extends State<ModeButtonWidget> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: GlassmorphicContainer(
          width: 120,
          height: 50,
          borderRadius: 25,
          linearGradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              widget.isActive 
                  ? _isHovering ? const Color.fromARGB(255, 90, 123, 221).withAlpha(200) : const Color.fromARGB(255, 90, 123, 221).withAlpha(160)
                  : _isHovering ? const Color.fromARGB(255, 80, 80, 80).withAlpha(180) : const Color.fromARGB(255, 80, 80, 80).withAlpha(130),
              widget.isActive 
                  ? _isHovering ? Color.fromARGB(255, 76, 105, 190).withAlpha(160) : Color.fromARGB(255, 76, 105, 190).withAlpha(130)
                  : _isHovering ? const Color.fromARGB(255, 60, 60, 60).withAlpha(150): const Color.fromARGB(255, 60, 60, 60).withAlpha(110),
            ],
          ),
          border: 0.3,
          blur: 0.5,
          borderGradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              widget.isActive
                  ? const Color.fromARGB(255, 170, 186, 242)
                  : const Color.fromARGB(255, 150, 150, 150),
              widget.isActive
                  ? const Color.fromARGB(255, 140, 162, 236)
                  : const Color.fromARGB(255, 120, 120, 120),
            ],
          ),
          child: Center(
            child: Text(
              widget.label,
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Montserrat',
                fontWeight: widget.isActive ? FontWeight.w600 : FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}