// timer_service.dart
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';

enum TimerMode { infinite, countdown, pomodoro }

final AudioPlayer _audioPlayer = AudioPlayer();

class TimerService extends ChangeNotifier {
  static final TimerService _instance = TimerService._internal();
  factory TimerService() => _instance;
  TimerService._internal();

  // Timer state
  TimerMode _currentMode = TimerMode.infinite;
  bool _isRunning = false;
  int _currentSeconds = 0;
  Timer? _timer;

  // Work-Rest settings
  int _workMinutes = 50;
  int _restMinutes = 10;
  bool _isWorkPeriod = true;

  // Selected values
  int? _selectedWork = 50;
  int? _selectedRest = 10;

  // Getters
  TimerMode get currentMode => _currentMode;
  bool get isRunning => _isRunning;
  int get currentSeconds => _currentSeconds;
  int get workMinutes => _workMinutes;
  int get restMinutes => _restMinutes;
  bool get isWorkPeriod => _isWorkPeriod;
  int? get selectedWork => _selectedWork;
  int? get selectedRest => _selectedRest;

  void updateSelectedTimes(int? work, int? rest) {
    _selectedWork = work;
    _selectedRest = rest;
    notifyListeners();
  }

  void updatePomodoroTimes() {
    _workMinutes = _selectedWork ?? 50;
    _restMinutes = _selectedRest ?? 10;

    if (_currentMode == TimerMode.pomodoro) {
      _currentSeconds = _isWorkPeriod ? _workMinutes * 60 : _restMinutes * 60;
      notifyListeners();
    }
  }

// Alternative fix: Modify the timer logic in startTimer()
void startTimer() {
  if (_isRunning) return;
  
  _isRunning = true;
  notifyListeners();

  _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
    // For infinite timer, increment
    if (_currentMode == TimerMode.infinite) {
      _currentSeconds++;
    }
    // For countdown and pomodoro, decrement
    else if (_currentSeconds > 0) {
      _currentSeconds--;
      
      // Check if we just hit zero for pomodoro
      if (_currentSeconds == 0 && _currentMode == TimerMode.pomodoro) {
        _togglePomodoro();
        return; // Exit early to prevent immediate decrement
      }
    }
    // When countdown reaches zero (non-pomodoro)
    else {
      pauseTimer();
    }
    notifyListeners();
  });
}

  void pauseTimer() {
    _isRunning = false;
    _timer?.cancel();
    notifyListeners();
  }

  void resetTimer() {
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
    notifyListeners();
  }

  void _togglePomodoro() async {
    // Play appropriate audio based on current state (before toggling)
    if (_isWorkPeriod) {
      // Work period just ended, about to start rest
      await _audioPlayer.play(AssetSource('audio/start_resting.mp3'));
    } else {
      // Rest period just ended, about to start work
      await _audioPlayer.play(AssetSource('audio/start_working.mp3'));
    }

    _isWorkPeriod = !_isWorkPeriod;
    _currentSeconds = _isWorkPeriod ? _workMinutes * 60 : _restMinutes * 60;
    notifyListeners();
  }

  void setTimerMode(TimerMode mode) {
    if (_currentMode != mode) {
      _timer?.cancel();
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
      notifyListeners();
    }
  }

  String formatTime() {
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

  String getModeStatusText() {
    if (_currentMode == TimerMode.pomodoro) {
      return _isWorkPeriod ? "Work Period" : "Rest Period";
    }
    return "";
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
