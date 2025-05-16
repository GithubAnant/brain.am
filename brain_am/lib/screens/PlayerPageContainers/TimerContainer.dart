// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_print

import 'dart:async';
import 'package:brain.am/screens/PlayerPageContainers/HomeContainer.dart';
import 'package:brain.am/widgets/DurationField.dart';
import 'package:brain.am/widgets/ModeButtonWidget.dart';
import 'package:brain.am/widgets/PlayerContainerBackgroundImage.dart';
import 'package:brain.am/widgets/GlassButton.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

// Timer mode enum
enum TimerMode { infinite, countdown, workRest }

class TimerContainer extends StatefulWidget {
  const TimerContainer({super.key});

  @override
  State<TimerContainer> createState() => _TimerContainerState();
}

class _TimerContainerState extends State<TimerContainer> {
  TimerMode _currentMode = TimerMode.infinite;

  // Timer properties
  bool _isRunning = false;
  int _currentSeconds = 0;
  Timer? _timer;

  // Work-Rest settings
  int _workMinutes = 25;
  int _restMinutes = 5;
  bool _isWorkPeriod = true;

  // Text editing controllers
  final TextEditingController _workController = TextEditingController(
    text: "25",
  );
  final TextEditingController _restController = TextEditingController(
    text: "5",
  );

  @override
  void initState() {
    super.initState();
    _updateWorkRestTimes();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _workController.dispose();
    _restController.dispose();
    super.dispose();
  }

  void _updateWorkRestTimes() {
    _workMinutes = int.tryParse(_workController.text) ?? 25;
    _restMinutes = int.tryParse(_restController.text) ?? 5;

    if (_currentMode == TimerMode.workRest) {
      setState(() {
        _currentSeconds = _isWorkPeriod ? _workMinutes * 60 : _restMinutes * 60;
      });
    }
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
        // For countdown and work-rest, decrement
        else if (_currentSeconds > 0) {
          _currentSeconds--;
        }
        // When countdown reaches zero
        else {
          if (_currentMode == TimerMode.workRest) {
            _toggleWorkRest();
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
        _isWorkPeriod = true;
        _currentSeconds = _workMinutes * 60;
      }
    });
  }

  void _toggleWorkRest() {
    setState(() {
      _isWorkPeriod = !_isWorkPeriod;
      _currentSeconds = _isWorkPeriod ? _workMinutes * 60 : _restMinutes * 60;
    });
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
          _isWorkPeriod = true;
          _currentSeconds = _workMinutes * 60;
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
    if (_currentMode == TimerMode.workRest) {
      return _isWorkPeriod ? "Work Period" : "Rest Period";
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
          BackgroundImage(
            containerWidth: containerWidth,
            containerHeight: containerHeight,
          ),

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

                  if (_currentMode == TimerMode.workRest)
                    Text(
                      _getModeStatusText(),
                      style: const TextStyle(
                        fontSize: 24,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        color: Colors.white70,
                      ),
                    ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                  // Timer controls
                  Column(
                    children: [
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
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          GlassButton(icon: Icons.refresh, onTap: _resetTimer),
                        ],
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),

                      // Work-Rest Input Fields (only shown in workRest mode)
                      if (_currentMode == TimerMode.workRest)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              DurationField(
                                Controller: _workController,
                                labelText: 'Work',
                              ),

                              const SizedBox(width: 15),

                              DurationField(
                                Controller: _restController,
                                labelText: 'Rest',
                              ),

                              const SizedBox(width: 15),

                              GlassButton2(
                                icon: Icons.check,
                                onTap: () {
                                  _updateWorkRestTimes();
                                  FocusScope.of(context).unfocus();
                                },
                              ),
                            ],
                          ),
                        ),

                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),

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
                          // Work-Rest timer button
                          ModeButtonWidget(
                            label: "Pomodoro",
                            isActive: _currentMode == TimerMode.workRest,
                            onTap: () => _setTimerMode(TimerMode.workRest),
                          ),
                        ],
                      ),
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






