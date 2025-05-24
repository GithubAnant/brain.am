import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:brain.am/services/music_player_service.dart';

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

class PauseButton extends StatefulWidget {
  const PauseButton({super.key});

  @override
  State<PauseButton> createState() => _PauseButtonState();
}

class _PauseButtonState extends State<PauseButton> {
  bool isPaused = false;
  bool _isHovering = false;
  final MusicPlayerService _musicService = MusicPlayerService();

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: IconButton(
        splashColor: Colors.transparent,
        icon: SvgPicture.asset(
          'assets/icons/${isPaused ? 'play' : 'pause-circle'}.svg',
          width: _isHovering ? 45 * 1.02 : 45,
          colorFilter: ColorFilter.mode(
            Color.fromARGB(_isHovering ? 220 : 210, 255, 255, 255),
            BlendMode.srcIn,
          ),
        ),
        onPressed: () async {
          setState(() {
            isPaused = !isPaused;
          });
          
          if (isPaused) {
            await _musicService.audioPlayer.pause();
          } else {
            await _musicService.audioPlayer.resume();
          }
        },
      ),
    );
  }
}

class NextButton extends StatefulWidget {
  const NextButton({super.key, required this.svgPath});

  final String svgPath;

  @override
  State<NextButton> createState() => _NextButtonState();
}

class _NextButtonState extends State<NextButton> {
  bool _isHovering = false;
  final MusicPlayerService _musicService = MusicPlayerService();

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: IconButton(
        icon: SvgPicture.asset(
          widget.svgPath,
          width: _isHovering ? 25 * 1.02 : 25,
          colorFilter: ColorFilter.mode(
            Colors.white.withAlpha(_isHovering ? 220 : 120),
            BlendMode.srcIn,
          ),
        ),
        onPressed: () {
          _musicService.nextSong();
        },
      ),
    );
  }
}

class PrevButton extends StatefulWidget {
  const PrevButton({super.key, required this.svgPath});

  final String svgPath;

  @override
  State<PrevButton> createState() => _PrevButtonState();
}

class _PrevButtonState extends State<PrevButton> {
  bool _isHovering = false;
  final MusicPlayerService _musicService = MusicPlayerService();

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: IconButton(
        icon: SvgPicture.asset(
          widget.svgPath,
          width: _isHovering ? 25 * 1.02 : 25,
          colorFilter: ColorFilter.mode(
            Colors.white.withAlpha(_isHovering ? 220 : 120),
            BlendMode.srcIn,
          ),
        ),
        onPressed: () {
          _musicService.previousSong();
        },
      ),
    );
  }
}

class Shuffle extends StatefulWidget {
  const Shuffle({super.key, required this.svgPath});

  final String svgPath;

  @override
  State<Shuffle> createState() => _ShuffleState();
}

class _ShuffleState extends State<Shuffle> {
  bool _isHovering = false;
  final MusicPlayerService _musicService = MusicPlayerService();

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: IconButton(
        icon: SvgPicture.asset(
          widget.svgPath,
          width: _isHovering ? 22 * 1.02 : 22,
          colorFilter: ColorFilter.mode(
            Colors.white.withAlpha(_isHovering || _musicService.isShuffle ? 250 : 120),
            BlendMode.srcIn,
          ),
        ),
        onPressed: () {
          setState(() {
            _musicService.isShuffle = !_musicService.isShuffle;
          });
        },
      ),
    );
  }
}

class Loop extends StatefulWidget {
  const Loop({super.key, required this.svgPath});

  final String svgPath;

  @override
  State<Loop> createState() => _LoopState();
}

class _LoopState extends State<Loop> {
  bool _isHovering = false;
  final MusicPlayerService _musicService = MusicPlayerService();

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: IconButton(
        icon: SvgPicture.asset(
          widget.svgPath,
          width: _isHovering ? 20 * 1.02 : 20,
          colorFilter: ColorFilter.mode(
            Colors.white.withAlpha(_isHovering || _musicService.isLoop ? 250 : 120),
            BlendMode.srcIn,
          ),
        ),
        onPressed: () {
          setState(() {
            _musicService.isLoop = !_musicService.isLoop;
          });
        },
      ),
    );
  }
}
