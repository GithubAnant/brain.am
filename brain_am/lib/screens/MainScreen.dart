import 'package:brain.am/controllers/screen_controller.dart';
import 'package:brain.am/screens/PlayerPageContainers/CategoryContainer.dart';
import 'package:brain.am/screens/PlayerPageContainers/HomeContainer.dart';
import 'package:brain.am/widgets/LandingPageWidgets/DemoImage.dart';
import 'package:brain.am/widgets/LandingPageWidgets/HeaderText.dart';
import 'package:brain.am/widgets/LandingPageWidgets/HeroText.dart';
import 'package:brain.am/widgets/LandingPageWidgets/MainContainer.dart';
import 'package:brain.am/widgets/SocialLink.dart';
import 'package:brain.am/widgets/LandingPageWidgets/StartListeningButton.dart';
import 'package:brain.am/widgets/ChooseModeScreenWidgets/FocusGlassContainer.dart';
import 'package:brain.am/widgets/ChooseModeScreenWidgets/SmallGlassMorphContainer.dart';
import 'package:brain.am/widgets/PlayerScreenWidgets/BottomMusicController.dart';
import 'package:brain.am/widgets/PlayerScreenWidgets/OptionsSidebar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  // Create instance of our controller
  final ScreenController screenController = Get.put(ScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromARGB(0, 0, 0, 0),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),

          Positioned.fill(child: Container(color: Colors.black.withAlpha(50))),

          Positioned(
            bottom: 13,
            left: 0,
            right: 0,
            child: Center(
              child: SocialLink(urlLink: 'https://github.com/GithubAnant'),
            ),
          ),

          // Content changes based on screen state with transitions
          Obx(() {
            final currentScreen = screenController.currentScreen.value;

            // Add a key to help AnimatedSwitcher identify unique widgets
            final Widget content;

            switch (currentScreen) {
              case ScreenState.home:
                content = HomeScreen();
                break;

              case ScreenState.chooseMode:
                content = ChooseMode();
                break;

              case ScreenState.player:
                content = Player();
                break;
            }

            return AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              transitionBuilder:
                  (child, animation) =>
                      FadeTransition(opacity: animation, child: child),

              child: content,
            );
          }),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      key: ValueKey('home'),
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.04),
        Center(child: MainContainer()),
      ],
    );
  }
}

class Player extends StatelessWidget {
  const Player({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      key: ValueKey('player'),
      children: [
        OptionsSidebar(),
        CategoryContainer(),
        BottomMusicController(),
      ],
    );
  }
}

class ChooseMode extends StatelessWidget {
  const ChooseMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      key: ValueKey('chooseMode'),
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FocusGlassContainer(text: 'Focus'),
            Column(
              children: [
                SmallGlassMorphContainer(
                  text: 'Chill',
                  startColor: const Color(0xFFFF5E62).withAlpha(179),
                  endColor: const Color(0xFFFF9966).withAlpha(153),
                ),
                SmallGlassMorphContainer(
                  text: 'Sleep',
                  startColor: const Color(0xFF56CCF2).withAlpha(179),
                  endColor: const Color(0xFF2F80ED).withAlpha(153),
                ),
                SmallGlassMorphContainer(
                  text: 'Study',
                  startColor: const Color(0xFF00C9A7).withAlpha(179),
                  endColor: const Color(0xFF92FE9D).withAlpha(153),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
