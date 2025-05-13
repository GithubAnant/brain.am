import 'package:brain.am/screens/ChooseModePage.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:get/get.dart';

class StartListeningButton extends StatefulWidget {
  const StartListeningButton({super.key});

  @override
  State<StartListeningButton> createState() => _StartListeningButtonState();
}

class _StartListeningButtonState extends State<StartListeningButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final blurAmount = _isHovered ? 55.0 : 20.0;
    final widthButton = _isHovered ? MediaQuery.of(context).size.width * 0.143 : MediaQuery.of(context).size.width * 0.14; 

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: InkWell(
        borderRadius: BorderRadius.circular(40),
        onTap: () {
          Get.to(const ChooseModePage(), transition: Transition.zoom);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeIn,
          child: GlassmorphicContainer(
            height: MediaQuery.of(context).size.height * 0.07,
            width: widthButton,
            borderRadius: 40,
            blur: blurAmount,
            alignment: Alignment.center,
            border: 0.7,
            linearGradient: LinearGradient(
              colors: [
                Colors.white.withAlpha(20),
                Colors.white.withAlpha(13),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderGradient: LinearGradient(
              colors: [
                Colors.white.withAlpha(77),
                Colors.white.withAlpha(26),
              ],
            ),
            child: Text(
              'START LISTENING',
              style: TextStyle(
                fontFamily: 'Lato',
                color: const Color.fromARGB(255, 192, 192, 192),
                fontWeight: FontWeight.w400,
                fontSize: MediaQuery.of(context).size.height * 0.02,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
