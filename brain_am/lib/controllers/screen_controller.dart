import 'package:get/get.dart';

// Enum to define different screen states
enum ScreenState {
  home,
  chooseMode,
  player
}

class ScreenController extends GetxController {
  // Observable variable to track current screen
  var currentScreen = ScreenState.player.obs;
  
  // Track previous screens for back navigation
  final List<ScreenState> _navigationHistory = [ScreenState.home];

  // Methods to change the screen state with transition
  void goToHome() {
    _changeScreen(ScreenState.home);
  }

  void goToChooseMode() {
    _changeScreen(ScreenState.chooseMode);
  }

  void goToPlayer() {
    _changeScreen(ScreenState.player);
  }
  
  // Handle back navigation
  bool goBack() {
    if (_navigationHistory.length > 1) {
      // Remove current screen
      _navigationHistory.removeLast();
      // Get previous screen
      final previousScreen = _navigationHistory.last;
      // Set current screen without adding to history
      currentScreen.value = previousScreen;
      return true;
    }
    return false; 
  }
  
  void _changeScreen(ScreenState newScreen) {
    if (currentScreen.value != newScreen) {
      _navigationHistory.add(newScreen);
      currentScreen.value = newScreen;
    }
  }
}