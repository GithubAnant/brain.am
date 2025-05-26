import 'dart:async';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:brain.am/widgets/PlayerScreenWidgets/MusicButtons.dart';
import 'package:flutter/foundation.dart';
import 'package:brain.am/constants/globals.dart' as global;

class MusicPlayerService extends ChangeNotifier {
  static final MusicPlayerService _instance = MusicPlayerService._internal();
  factory MusicPlayerService() => _instance;
  MusicPlayerService._internal();

  final AudioPlayer _audioPlayer = AudioPlayer();

  final List<String> _songPaths = [
    'assets/music/postrock_full.mp3',
    'assets/music/rainforest_full.mp3',
    'assets/music/rain_full.mp3',
    'assets/music/vintage_full.mp3',
    'assets/music/ambient.mp3',
    'assets/music/electronic.mp3',
    'assets/music/lofi.mp3',
    'assets/music/melancholy.mp3',
    'assets/music/oceanic.mp3',
    'assets/music/study.mp3',
    'assets/music/tent_rain.mp3',
  ];
  

  final Map<String, Map<String, String>> songMeta = {
    'postrock_full.mp3': {
      'image': 'assets/images/MusicPhotos1/postrock.jpg',
      'title': 'Last Spring',
      'type': 'Post Rock',
    },
    'rainforest_full.mp3': {
      'image': 'assets/images/MusicPhotos1/rainforest.jpg',
      'title': 'Forest Amuse',
      'type': 'Rainforest',
    },
    'rain_full.mp3': {
      'image': 'assets/images/MusicPhotos1/thunderstorm.jpg',
      'title': 'Second Storm',
      'type': 'Rain',
    },
    'vintage_full.mp3': {
      'image': 'assets/images/MusicPhotos1/vintage.jpg',
      'title': 'Smoke Days',
      'type': 'Vintage',
    },
    'ambient.mp3': {
      'image': 'assets/images/MusicPhotos1/ambient.jpg',
      'title': 'The Dawn',
      'type': 'Ambient',
    },
    'electronic.mp3': {
      'image': 'assets/images/MusicPhotos1/electronic.jpg',
      'title': 'Velvet Vires',
      'type': 'Upbeat',
    },
    'lofi.mp3': {
      'image': 'assets/images/MusicPhotos1/lofi.jpg',
      'title': 'Everyone Knew',
      'type': 'Lofi',
    },
    'melancholy.mp3': {
      'image': 'assets/images/MusicPhotos1/melancholy.jpg',
      'title': 'Next December',
      'type': 'Melancholy',
    },
    'oceanic.mp3': {
      'image': 'assets/images/MusicPhotos1/oceanic.jpg',
      'title': 'White Corals',
      'type': 'Ocean',
    },
    'study.mp3': {
      'image': 'assets/images/MusicPhotos1/study.JPG',
      'title': 'Backspace Crater',
      'type': 'Instrumental',
    },
    'tent_rain.mp3': {
      'image': 'assets/images/MusicPhotos1/tent_rain.jpg',
      'title': 'Midnight Monsoons',
      'type': 'Thunderstorm',
    },
  };

  // Song names for display (without path and extension)
  final List<String> _songNames = [
    'Post Rock',
    'Rainforest',
    'Rain',
    'Vintage',
    'Ambient',
    'Upbeat',
    'Lofi',
    'Melancholy',
    'Ocean',
    'Instrumental',
    'Thunderstorm',
  ];

  int _currentSongIndex = 0;
  bool _isPlaying = false;
  bool _isShuffle = false;
  bool _isLoop = false;
  bool _isInitialized = false;
  Duration _currentPosition = Duration.zero;
  Duration _currentDuration = Duration.zero;

  // Getters
  AudioPlayer get audioPlayer => _audioPlayer;
  bool get isPlaying => _isPlaying;
  bool get isShuffle => _isShuffle;
  bool get isLoop => _isLoop;
  bool get isInitialized => _isInitialized;
  String get currentSongPath => _songPaths[_currentSongIndex];
  String get currentSongName => _songNames[_currentSongIndex];
  int get currentSongIndex => _currentSongIndex;
  Duration get currentPosition => _currentPosition;
  Duration get currentDuration => _currentDuration;
  List<String> get songNames => _songNames;

  // Setters
  set isShuffle(bool value) {
    _isShuffle = value;
    notifyListeners();
  }

  set isLoop(bool value) {
    _isLoop = value;
    notifyListeners();
  }

  Future<void> initialize() async {
    if (_isInitialized) return;

    try {
      // Set up audio player listeners  
      _setupAudioListeners();

      // Select a random song to start with
      _selectRandomSong();

      // Play the selected song
      await playCurrentSong();

      _isInitialized = true;
      notifyListeners();
    } catch (e) {
      debugPrint('Error initializing MusicPlayerService: $e');
    }
  }

  /// Set up audio player event listeners
  void _setupAudioListeners() {
    _audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      _isPlaying = state == PlayerState.playing;
      notifyListeners();
    });

    _audioPlayer.onDurationChanged.listen((Duration duration) {
      _currentDuration = duration;
      notifyListeners();
    });

    _audioPlayer.onPositionChanged.listen((Duration position) {
      _currentPosition = position;
      notifyListeners();
    });

    _audioPlayer.onPlayerComplete.listen((_) {
      if (_isLoop) {
        playCurrentSong();
      } else {
        nextSong();
      }
    });
  }

  /// Select a random song from the available songs
  void _selectRandomSong() {
    final random = Random();
    _currentSongIndex = random.nextInt(_songPaths.length);
  }

   Future<void> playCurrentSong([context]) async {
    try {
      if (context != null) {
        LoadingSnackbar.show(context, 'Loading track...');
      }

      final songAsset = _songPaths[_currentSongIndex];
      final filename = songAsset.split('/').last;

      // Play song
      await _audioPlayer.play(
        AssetSource(songAsset.replaceFirst('assets/', '')),
      );
      _isPlaying = true;
      notifyListeners();

      // Update global ValueNotifiers
      final meta = songMeta[filename];
      if (meta != null) {
        global.imagePath.value = meta['image']!;
        global.songTitle.value = meta['title']!;
        global.songType.value = meta['type']!;
      }

      if (context != null) {
        LoadingSnackbar.hide(context);
      }
    } catch (e) {
      debugPrint('Error playing song: $e');
      if (context != null) {
        LoadingSnackbar.hide(context);
      }
    }
  }

  /// Play or resume audio
  Future<void> play() async {
    if (!_isInitialized) {
      await initialize();
      return;
    }

    try {
      if (_audioPlayer.state == PlayerState.paused) {
        await _audioPlayer.resume();
      } else {
        await playCurrentSong();
      }
    } catch (e) {
      debugPrint('Error playing audio: $e');
    }
  }

  /// Pause audio
  Future<void> pause() async {
    try {
      await _audioPlayer.pause();
      _isPlaying = false;
      notifyListeners();
    } catch (e) {
      debugPrint('Error pausing audio: $e');
    }
  }

  /// Toggle play/pause
  Future<void> togglePlayPause() async {
    if (_isPlaying) {
      await pause();
    } else {
      await play();
    }
  }

  /// Play next song
  Future<void> nextSong() async {
    if (_isShuffle) {
      _selectRandomSong();
    } else {
      _currentSongIndex = (_currentSongIndex + 1) % _songPaths.length;
    }
    await playCurrentSong();
    notifyListeners();
  }

  /// Play previous song
  Future<void> previousSong() async {
    if (_isShuffle) {
      _selectRandomSong();
    } else {
      _currentSongIndex =
          (_currentSongIndex - 1 + _songPaths.length) % _songPaths.length;
    }
    await playCurrentSong();
    notifyListeners();
  }

  /// Seek to specific position
  Future<void> seek(Duration position) async {
    try {
      await _audioPlayer.seek(position);
    } catch (e) {
      debugPrint('Error seeking audio: $e');
    }
  }

  /// Set volume (0.0 to 1.0)
  Future<void> setVolume(double volume) async {
    try {
      await _audioPlayer.setVolume(volume.clamp(0.0, 1.0));
    } catch (e) {
      debugPrint('Error setting volume: $e');
    }
  }

  /// Play specific song by index
  Future<void> playSongByIndex(int index) async {
    if (index >= 0 && index < _songPaths.length) {
      _currentSongIndex = index;
      await playCurrentSong();
      notifyListeners();
    }
  }

  /// Play specific song by name
  Future<void> playSongByName(String songName) async {
    final index = _songNames.indexOf(songName);
    if (index != -1) {
      await playSongByIndex(index);
    }
  }

  /// Dispose resources
  Future<void> dispose() async {
    await _audioPlayer.dispose();
    super.dispose();
  }
}

