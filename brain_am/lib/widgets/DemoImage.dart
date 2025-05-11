
import 'package:flutter/material.dart';

class DemoImage extends StatelessWidget {
  const DemoImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: BoxDecoration(
        color: const Color(0xFF12171D),
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(color: Colors.black.withAlpha(122), blurRadius: 30),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Placeholder(
        fallbackWidth: MediaQuery.of(context).size.width * 0.3,
        fallbackHeight: MediaQuery.of(context).size.height * 0.2,
      ),
    );
  }
}
