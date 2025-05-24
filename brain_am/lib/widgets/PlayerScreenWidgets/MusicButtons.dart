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

// class PauseButton extends StatefulWidget {
//   const PauseButton({super.key});

//   @override
//   State<PauseButton> createState() => _PauseButtonState();
// }

// class _PauseButtonState extends State<PauseButton> {
//   bool isPaused = false;
//   bool _isHovering = false;
//   final MusicPlayerService _musicService = MusicPlayerService();

//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: (_) => setState(() => _isHovering = true),
//       onExit: (_) => setState(() => _isHovering = false),
//       child: IconButton(
//         splashColor: Colors.transparent,
//         icon: SvgPicture.asset(
//           'assets/icons/${isPaused ? 'play' : 'pause-circle'}.svg',
//           width: _isHovering ? 45 * 1.02 : 45,
//           colorFilter: ColorFilter.mode(
//             Color.fromARGB(_isHovering ? 220 : 210, 255, 255, 255),
//             BlendMode.srcIn,
//           ),
//         ),
//         onPressed: () async {
//           setState(() {
//             isPaused = !isPaused;
//           });
          
//           if (isPaused) {
//             await _musicService.audioPlayer.pause();
//           } else {
//             await _musicService.audioPlayer.resume();
//           }
//         },
//       ),
//     );
//   }
// }

// class NextButton extends StatefulWidget {
//   const NextButton({super.key, required this.svgPath});

//   final String svgPath;

//   @override
//   State<NextButton> createState() => _NextButtonState();
// }

// class _NextButtonState extends State<NextButton> {
//   bool _isHovering = false;
//   final MusicPlayerService _musicService = MusicPlayerService();

//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: (_) => setState(() => _isHovering = true),
//       onExit: (_) => setState(() => _isHovering = false),
//       child: IconButton(
//         icon: SvgPicture.asset(
//           widget.svgPath,
//           width: _isHovering ? 25 * 1.02 : 25,
//           colorFilter: ColorFilter.mode(
//             Colors.white.withAlpha(_isHovering ? 220 : 120),
//             BlendMode.srcIn,
//           ),
//         ),
//         onPressed: () {
//           _musicService.nextSong();
//         },
//       ),
//     );
//   }
// }

// class PrevButton extends StatefulWidget {
//   const PrevButton({super.key, required this.svgPath});

//   final String svgPath;

//   @override
//   State<PrevButton> createState() => _PrevButtonState();
// }

// class _PrevButtonState extends State<PrevButton> {
//   bool _isHovering = false;
//   final MusicPlayerService _musicService = MusicPlayerService();

//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: (_) => setState(() => _isHovering = true),
//       onExit: (_) => setState(() => _isHovering = false),
//       child: IconButton(
//         icon: SvgPicture.asset(
//           widget.svgPath,
//           width: _isHovering ? 25 * 1.02 : 25,
//           colorFilter: ColorFilter.mode(
//             Colors.white.withAlpha(_isHovering ? 220 : 120),
//             BlendMode.srcIn,
//           ),
//         ),
//         onPressed: () {
//           _musicService.previousSong();
//         },
//       ),
//     );
//   }
// }

// class Shuffle extends StatefulWidget {
//   const Shuffle({super.key, required this.svgPath});

//   final String svgPath;

//   @override
//   State<Shuffle> createState() => _ShuffleState();
// }

// class _ShuffleState extends State<Shuffle> {
//   bool _isHovering = false;
//   final MusicPlayerService _musicService = MusicPlayerService();

//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: (_) => setState(() => _isHovering = true),
//       onExit: (_) => setState(() => _isHovering = false),
//       child: IconButton(
//         icon: SvgPicture.asset(
//           widget.svgPath,
//           width: _isHovering ? 22 * 1.02 : 22,
//           colorFilter: ColorFilter.mode(
//             Colors.white.withAlpha(_isHovering || _musicService.isShuffle ? 250 : 120),
//             BlendMode.srcIn,
//           ),
//         ),
//         onPressed: () {
//           setState(() {
//             _musicService.isShuffle = !_musicService.isShuffle;
//           });
//         },
//       ),
//     );
//   }
// }

// class Loop extends StatefulWidget {
//   const Loop({super.key, required this.svgPath});

//   final String svgPath;

//   @override
//   State<Loop> createState() => _LoopState();
// }

// class _LoopState extends State<Loop> {
//   bool _isHovering = false;
//   final MusicPlayerService _musicService = MusicPlayerService();

//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: (_) => setState(() => _isHovering = true),
//       onExit: (_) => setState(() => _isHovering = false),
//       child: IconButton(
//         icon: SvgPicture.asset(
//           widget.svgPath,
//           width: _isHovering ? 20 * 1.02 : 20,
//           colorFilter: ColorFilter.mode(
//             Colors.white.withAlpha(_isHovering || _musicService.isLoop ? 250 : 120),
//             BlendMode.srcIn,
//           ),
//         ),
//         onPressed: () {
//           setState(() {
//             _musicService.isLoop = !_musicService.isLoop;
//           });
//         },
//       ),
//     );
//   }
// }

// Add this utility class for the glassmorphic snackbar
class LoadingSnackbar {
  static void show(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.white.withOpacity(0.2),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.white.withOpacity(0.8),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                message,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  static void hide(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }
}

// Updated PauseButton with loading snackbar
class PauseButton extends StatefulWidget {
  const PauseButton({super.key});

  @override
  State<PauseButton> createState() => _PauseButtonState();
}

class _PauseButtonState extends State<PauseButton> {
  bool isPaused = false;
  bool _isHovering = false;
  bool _isLoading = false;
  final MusicPlayerService _musicService = MusicPlayerService();

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: IconButton(
        splashColor: Colors.transparent,
        icon: _isLoading
            ? SizedBox(
                width: 45,
                height: 45,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.white.withOpacity(0.8),
                  ),
                ),
              )
            : SvgPicture.asset(
                'assets/icons/${isPaused ? 'play' : 'pause-circle'}.svg',
                width: _isHovering ? 45 * 1.02 : 45,
                colorFilter: ColorFilter.mode(
                  Color.fromARGB(_isHovering ? 220 : 210, 255, 255, 255),
                  BlendMode.srcIn,
                ),
              ),
        onPressed: _isLoading ? null : () async {
          setState(() {
            _isLoading = true;
            isPaused = !isPaused;
          });

          try {
            if (isPaused) {
              LoadingSnackbar.show(context, 'Pausing track...');
              await _musicService.audioPlayer.pause();
            } else {
              LoadingSnackbar.show(context, 'Loading track...');
              await _musicService.audioPlayer.resume();
            }
          } catch (e) {
            debugPrint('Error toggling playback: $e');
          } finally {
            setState(() {
              _isLoading = false;
            });
            LoadingSnackbar.hide(context);
          }
        },
      ),
    );
  }
}

// Updated NextButton with loading snackbar
class NextButton extends StatefulWidget {
  const NextButton({super.key, required this.svgPath});

  final String svgPath;

  @override
  State<NextButton> createState() => _NextButtonState();
}

class _NextButtonState extends State<NextButton> {
  bool _isHovering = false;
  bool _isLoading = false;
  final MusicPlayerService _musicService = MusicPlayerService();

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: IconButton(
        icon: _isLoading
            ? SizedBox(
                width: 25,
                height: 25,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.white.withOpacity(0.8),
                  ),
                ),
              )
            : SvgPicture.asset(
                widget.svgPath,
                width: _isHovering ? 25 * 1.02 : 25,
                colorFilter: ColorFilter.mode(
                  Colors.white.withAlpha(_isHovering ? 220 : 120),
                  BlendMode.srcIn,
                ),
              ),
        onPressed: _isLoading ? null : () async {
          setState(() {
            _isLoading = true;
          });

          LoadingSnackbar.show(context, 'Loading next track...');
          
          try {
            await _musicService.nextSong();
          } catch (e) {
            debugPrint('Error playing next song: $e');
          } finally {
            setState(() {
              _isLoading = false;
            });
            LoadingSnackbar.hide(context);
          }
        },
      ),
    );
  }
}

// Updated PrevButton with loading snackbar
class PrevButton extends StatefulWidget {
  const PrevButton({super.key, required this.svgPath});

  final String svgPath;

  @override
  State<PrevButton> createState() => _PrevButtonState();
}

class _PrevButtonState extends State<PrevButton> {
  bool _isHovering = false;
  bool _isLoading = false;
  final MusicPlayerService _musicService = MusicPlayerService();

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: IconButton(
        icon: _isLoading
            ? SizedBox(
                width: 25,
                height: 25,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.white.withOpacity(0.8),
                  ),
                ),
              )
            : SvgPicture.asset(
                widget.svgPath,
                width: _isHovering ? 25 * 1.02 : 25,
                colorFilter: ColorFilter.mode(
                  Colors.white.withAlpha(_isHovering ? 220 : 120),
                  BlendMode.srcIn,
                ),
              ),
        onPressed: _isLoading ? null : () async {
          setState(() {
            _isLoading = true;
          });

          LoadingSnackbar.show(context, 'Loading previous track...');
          
          try {
            await _musicService.previousSong();
          } catch (e) {
            debugPrint('Error playing previous song: $e');
          } finally {
            setState(() {
              _isLoading = false;
            });
            LoadingSnackbar.hide(context);
          }
        },
      ),
    );
  }
}

// Updated Shuffle button (keeping original functionality)
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

// Updated Loop button (keeping original functionality)
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
