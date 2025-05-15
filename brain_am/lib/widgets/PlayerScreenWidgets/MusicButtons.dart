import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SpeakerButton extends StatelessWidget {
  const SpeakerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/speaker-full.svg',
      width: 16,
      colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
    );
  }
}

//
//
//
//
//
//
//
//
//s
//

class PauseButton extends StatelessWidget {
  const PauseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashColor: Colors.transparent,
      icon: SvgPicture.asset(
        'assets/icons/pause-circle.svg',
        width: 45,
        colorFilter: ColorFilter.mode(
          const Color.fromARGB(210, 255, 255, 255),
          BlendMode.srcIn,
        ),
      ),
      onPressed: () {},
    );
  }
}

//
//
//
//
//
//
//
//
//
//

class NextButton extends StatelessWidget {
  const NextButton({super.key, required this.svgPath});

  final String svgPath;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: SvgPicture.asset(
        svgPath,
        width: 25,
        colorFilter: ColorFilter.mode(
          Colors.white.withAlpha(200),
          BlendMode.srcIn,
        ),
      ),
      onPressed: () {},
    );
  }
}

//
//
//
//
//
//
//
//
//
//

class PrevButton extends StatelessWidget {
  const PrevButton({super.key, required this.svgPath});

  final String svgPath;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: SvgPicture.asset(
        svgPath,
        width: 25,
        colorFilter: ColorFilter.mode(
          Colors.white.withAlpha(200),
          BlendMode.srcIn,
        ),
      ),
      onPressed: () {},
    );
  }
}

//
//
//
//
//
//
//
//
//
//

class Shuffle extends StatelessWidget {
  const Shuffle({super.key, required this.svgPath});

  final String svgPath;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: SvgPicture.asset(
        svgPath,
        width: 22,
        colorFilter: ColorFilter.mode(
          Colors.white.withAlpha(200),
          BlendMode.srcIn,
        ),
      ),
      onPressed: () {},
    );
  }
}

//
//
//
//
//
//
//
//
//
//

class Loop extends StatelessWidget {
  const Loop({super.key, required this.svgPath});

  final String svgPath;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: SvgPicture.asset(
        svgPath,
        width: 20,
        colorFilter: ColorFilter.mode(
          Colors.white.withAlpha(200),
          BlendMode.srcIn,
        ),
      ),
      onPressed: () {},
    );
  }
}
