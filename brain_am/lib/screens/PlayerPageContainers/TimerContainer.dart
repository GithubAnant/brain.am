// Updated TimerContainer using TimerService
import 'package:brain.am/models/timer_service.dart';
import 'package:brain.am/screens/PlayerPageContainers/HomeContainer.dart';
import 'package:brain.am/widgets/DurationField.dart';
import 'package:brain.am/widgets/ModeButtonWidget.dart';
import 'package:brain.am/widgets/PlayerContainerBackgroundImage.dart';
import 'package:brain.am/widgets/GlassButton.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';


class TimerContainer extends StatefulWidget {
  const TimerContainer({super.key});

  @override
  State<TimerContainer> createState() => _TimerContainerState();
}

class _TimerContainerState extends State<TimerContainer> {
  late TimerService _timerService;

  @override
  void initState() {
    super.initState();
    _timerService = TimerService();
    _timerService.addListener(_onTimerUpdate);
  }

  @override
  void dispose() {
    _timerService.removeListener(_onTimerUpdate);
    super.dispose();
  }

  void _onTimerUpdate() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    double containerWidth = MediaQuery.of(context).size.width * 0.66;
    double containerHeight = MediaQuery.of(context).size.height * 0.8;

    return Stack(
      children: [
        Positioned(
          left: MediaQuery.of(context).size.width * 0.18,
          top: MediaQuery.of(context).size.height * 0.08,
          child: MainStackTimer(containerWidth: containerWidth, containerHeight: containerHeight, timerService: _timerService),
        ),
      ],
    );
  }
}

class MainStackTimer extends StatelessWidget {
  const MainStackTimer({
    super.key,
    required this.containerWidth,
    required this.containerHeight,
    required TimerService timerService,
  }) : _timerService = timerService;

  final double containerWidth;
  final double containerHeight;
  final TimerService _timerService;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Image
        BackgroundImage(
          containerWidth: containerWidth,
          containerHeight: containerHeight,
        ),
    
        BlackTint(
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
          blur: 0,
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
                  _timerService.formatTime(),
                  style: const TextStyle(
                    fontSize: 80,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
    
                if (_timerService.currentMode == TimerMode.pomodoro)
                  Text(
                    _timerService.getModeStatusText(),
                    style: const TextStyle(
                      fontSize: 24,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      color: Colors.white70,
                    ),
                  ),
    
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
    
                // Timer controls
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Play/Pause button
                        GlassButton(
                          icon: _timerService.isRunning 
                              ? Icons.pause 
                              : Icons.play_arrow,
                          onTap: () {
                            if (_timerService.isRunning) {
                              _timerService.pauseTimer();
                            } else {
                              _timerService.startTimer();
                            }
                          },
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.02,
                        ),
                        GlassButton(
                          icon: Icons.refresh,
                          onTap: _timerService.resetTimer,
                        ),
                      ],
                    ),
    
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
    
                    if (_timerService.currentMode == TimerMode.pomodoro)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DurationDropdown(
                              value: _timerService.selectedWork,
                              onChanged: (val) {
                                _timerService.updateSelectedTimes(
                                  val, 
                                  _timerService.selectedRest
                                );
                              },
                              labelText: 'Work',
                              options: [20, 30, 40, 50, 60],
                            ),
                            const SizedBox(width: 15),
                            DurationDropdown(
                              value: _timerService.selectedRest,
                              onChanged: (val) {
                                _timerService.updateSelectedTimes(
                                  _timerService.selectedWork, 
                                  val
                                );
                              },
                              labelText: 'Rest',
                              options: [5, 10, 15, 20, 25],
                            ),
                            const SizedBox(width: 15),
    
                            GlassButton2(
                              icon: Icons.check,
                              onTap: () {
                                _timerService.updatePomodoroTimes();
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
                          isActive: _timerService.currentMode == TimerMode.infinite,
                          onTap: () => _timerService.setTimerMode(TimerMode.infinite),
                        ),
                        const SizedBox(width: 15),
                        // Countdown timer button
                        ModeButtonWidget(
                          label: "Timer",
                          isActive: _timerService.currentMode == TimerMode.countdown,
                          onTap: () => _timerService.setTimerMode(TimerMode.countdown),
                        ),
                        const SizedBox(width: 15),
                        // Work-Rest timer button
                        ModeButtonWidget(
                          label: "Pomodoro",
                          isActive: _timerService.currentMode == TimerMode.pomodoro,
                          onTap: () => _timerService.setTimerMode(TimerMode.pomodoro),
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
    );
  }
}