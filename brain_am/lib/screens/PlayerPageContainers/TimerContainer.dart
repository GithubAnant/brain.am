// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_print

import 'dart:async';
import 'package:brain.am/screens/PlayerPageContainers/HomeContainer.dart';
import 'package:brain.am/widgets/ModeButtonWidget.dart';
import 'package:brain.am/widgets/ResetPauseButton.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

// Timer mode enum
enum TimerMode { infinite, countdown, pomodoro }

class TimerContainer extends StatefulWidget {
  const TimerContainer({super.key});

  @override
  State<TimerContainer> createState() => _TimerContainerState();
}

class _TimerContainerState extends State<TimerContainer> {
  TimerMode _currentMode = TimerMode.infinite;

  // Timer properties
  bool _isRunning = false;
  int _currentSeconds = 00; // Default 25 minutes for pomodoro
  Timer? _timer;

  // Pomodoro settings
  final int _pomodoroTime = 1500; // 25 minutes
  final int _shortBreakTime = 300; // 5 minutes
  final int _longBreakTime = 900; // 15 minutes
  int _pomodoroCount = 0;
  bool _isBreak = false;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    setState(() {
      _isRunning = true;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        // For infinite timer, increment
        if (_currentMode == TimerMode.infinite) {
          _currentSeconds++;
        }
        // For countdown and pomodoro, decrement
        else if (_currentSeconds > 0) {
          _currentSeconds--;
        }
        // When countdown reaches zero
        else {
          if (_currentMode == TimerMode.pomodoro) {
            _handlePomodoroStateChange();
          } else {
            _pauseTimer();
          }
        }
      });
    });
  }

  void _pauseTimer() {
    setState(() {
      _isRunning = false;
      _timer?.cancel();
    });
  }

  void _resetTimer() {
    setState(() {
      _isRunning = false;
      _timer?.cancel();

      if (_currentMode == TimerMode.infinite) {
        _currentSeconds = 0;
      } else if (_currentMode == TimerMode.countdown) {
        _currentSeconds = 1500; // Default 25 minutes for countdown
      } else {
        _currentSeconds = _pomodoroTime;
        _isBreak = false;
        _pomodoroCount = 0;
      }
    });
  }

  void _handlePomodoroStateChange() {
    if (_isBreak) {
      // After break, start work
      setState(() {
        _currentSeconds = _pomodoroTime;
        _isBreak = false;
      });
    } else {
      // After work session, decide break type
      _pomodoroCount++;
      if (_pomodoroCount % 4 == 0) {
        // Every 4th pomodoro gets a long break
        setState(() {
          _currentSeconds = _longBreakTime;
          _isBreak = true;
        });
      } else {
        // Other pomodoros get short breaks
        setState(() {
          _currentSeconds = _shortBreakTime;
          _isBreak = true;
        });
      }
    }
  }

  void _setTimerMode(TimerMode mode) {
    if (_currentMode != mode) {
      _timer?.cancel();
      setState(() {
        _currentMode = mode;
        _isRunning = false;

        // Reset timer based on mode
        if (mode == TimerMode.infinite) {
          _currentSeconds = 0;
        } else if (mode == TimerMode.countdown) {
          _currentSeconds = 1500; // 25 minutes
        } else {
          _currentSeconds = _pomodoroTime;
          _isBreak = false;
          _pomodoroCount = 0;
        }
      });
    }
  }

  String _formatTime() {
    int minutes = _currentSeconds ~/ 60;
    int seconds = _currentSeconds % 60;

    // For infinite timer, show hours if needed
    if (_currentMode == TimerMode.infinite && minutes >= 60) {
      int hours = minutes ~/ 60;
      minutes = minutes % 60;
      return "${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
    } else {
      return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
    }
  }

  String _getModeStatusText() {
    if (_currentMode == TimerMode.pomodoro) {
      return _isBreak ? "Break Period" : "Focus Period";
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    double containerWidth = MediaQuery.of(context).size.width * 0.66;
    double containerHeight = MediaQuery.of(context).size.height * 0.8;

    return Positioned(
      left: MediaQuery.of(context).size.width * 0.18,
      top: MediaQuery.of(context).size.height * 0.08,
      child: Stack(
        children: [
          // Background Image
          BackgroundImage(containerWidth: containerWidth, containerHeight: containerHeight),


          // Glassmorphic Container
          GlassmorphicContainer(
            width: containerWidth,
            height: containerHeight,
            borderRadius: 15,
            linearGradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color.fromARGB(255, 255, 255, 255).withAlpha(20),
                const Color.fromARGB(255, 255, 255, 255).withAlpha(13),
              ],
            ),
            border: 0.3,
            blur: 0.5,
            borderGradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color.fromARGB(255, 201, 201, 201),
                const Color.fromARGB(210, 194, 194, 194),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Timer display
                  Text(
                    _formatTime(),
                    style: const TextStyle(
                      fontSize: 80,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                  ),

                  if (_currentMode == TimerMode.pomodoro)
                    Text(
                      _getModeStatusText(),
                      style: const TextStyle(
                        fontSize: 24,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        color: Colors.white70,
                      ),
                    ),

                  const SizedBox(height: 50),

                  // Timer controls
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Play/Pause button
                      GlassButton(
                        icon: _isRunning ? Icons.pause : Icons.play_arrow,
                        onTap: () {
                          if (_isRunning) {
                            _pauseTimer();
                          } else {
                            _startTimer();
                          }
                        },
                      ),

                      const SizedBox(width: 20),

                      GlassButton(icon: Icons.refresh, onTap: _resetTimer),

                      const SizedBox(height: 160),

                      // Mode selection buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Infinite timer button
                          ModeButtonWidget(
                            label: "Infinite",
                            isActive: _currentMode == TimerMode.infinite,
                            onTap: () => _setTimerMode(TimerMode.infinite),
                          ),

                          const SizedBox(width: 15),

                          // Countdown timer button
                          ModeButtonWidget(
                            label: "Timer",
                            isActive: _currentMode == TimerMode.countdown,
                            onTap: () => _setTimerMode(TimerMode.countdown),
                          ),

                          const SizedBox(width: 15),

                          // Pomodoro timer button
                          ModeButtonWidget(
                            label: "Pomodoro",
                            isActive: _currentMode == TimerMode.pomodoro,
                            onTap: () => _setTimerMode(TimerMode.pomodoro),
                          ),
                        ],
                      ),

                      const SizedBox(height: 30),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


