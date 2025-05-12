
import 'package:flutter/material.dart';

class DemoImage extends StatelessWidget {
  const DemoImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.3,
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: BoxDecoration(
          color: const Color(0xFF12171D),
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(color: const Color.fromARGB(255, 181, 181, 181), blurRadius: 60),
          ],
        ),
        padding: const EdgeInsets.all(0),
        child: Image.asset('assets/images/demo.png', fit: BoxFit.cover,)
      ),
    );
  }
}
