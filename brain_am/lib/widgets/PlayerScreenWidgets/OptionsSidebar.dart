// ignore_for_file: avoid_print

import 'package:brain.am/screens/PlayerPageContainers/CategoryContainer.dart';
import 'package:brain.am/screens/PlayerPageContainers/HomeContainer.dart';
import 'package:brain.am/screens/PlayerPageContainers/TimerContainer.dart';
import 'package:brain.am/screens/PlayerPageContainers/SpecificsContainer.dart';
import 'package:brain.am/screens/PlayerScreenMain.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:remixicon/remixicon.dart';

enum SelectedScreen { home, category, timer, uptime }

class OptionsSidebar extends StatefulWidget {
  final Function(Widget) onContainerChanged;

  const OptionsSidebar({super.key, required this.onContainerChanged});

  @override
  State<OptionsSidebar> createState() => _OptionsSidebarState();
}

class _OptionsSidebarState extends State<OptionsSidebar> {
  SelectedScreen _selectedScreen = SelectedScreen.home;

  @override
  void initState() {
    super.initState();
    // Show the default container on initialization
    _selectScreen(SelectedScreen.home);
  }

  void _selectScreen(SelectedScreen screen) {
    if (_selectedScreen != screen) {
      setState(() {
        _selectedScreen = screen;
      });

      // Provide the appropriate container widget to the callback
      switch (screen) {
        case SelectedScreen.home:
          widget.onContainerChanged(const HomeContainer());
          break;
        case SelectedScreen.category:
          widget.onContainerChanged(CategoryContainer());
          break;
        case SelectedScreen.timer:
          widget.onContainerChanged(const TimerContainer());
          break;
        case SelectedScreen.uptime:
          widget.onContainerChanged(
            SpecificsContainer(
              navigateToHome: () => _selectScreen(SelectedScreen.home),
            ),
          );
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: MediaQuery.of(context).size.width * 0.04,
      top: MediaQuery.of(context).size.height * 0.3,
      child: GlassmorphicContainer(
        width: MediaQuery.of(context).size.width * 0.05,
        height: MediaQuery.of(context).size.height * 0.4,
        borderRadius: 45,
        linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color.fromARGB(255, 255, 255, 255).withAlpha(20),
            const Color.fromARGB(255, 255, 255, 255).withAlpha(13),
          ],
        ),
        border: 0.3,
        blur: 10,
        borderGradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color.fromARGB(255, 255, 255, 255),
            const Color.fromARGB(210, 255, 255, 255),
          ],
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                IconSidebar(
                  iconName: RemixIcons.home_2_line,
                  isSelected: _selectedScreen == SelectedScreen.home,
                  onPressed: () => _selectScreen(SelectedScreen.home),
                ),
                IconSidebar(
                  iconName: RemixIcons.music_2_line,
                  isSelected: _selectedScreen == SelectedScreen.category,
                  onPressed: () => _selectScreen(SelectedScreen.category),
                ),
                IconSidebar(
                  iconName: RemixIcons.time_line,
                  isSelected: _selectedScreen == SelectedScreen.timer,
                  onPressed: () => _selectScreen(SelectedScreen.timer),
                ),
                IconSidebar(
                  iconName: RemixIcons.filter_2_line,
                  isSelected: _selectedScreen == SelectedScreen.uptime,
                  onPressed: () => _selectScreen(SelectedScreen.uptime),
                ),
              ],
            ),
          ),
        ),
      ),
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
class IconSidebar extends StatelessWidget {
  const IconSidebar({
    super.key,
    required this.iconName,
    required this.onPressed,
    required this.isSelected,
  });

  final IconData iconName;
  final VoidCallback onPressed;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.039),
      child: Container(
        decoration: BoxDecoration(
          color:
              isSelected
                  ? const Color.fromARGB(255, 31, 29, 29)
                  : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: IconButton(
          hoverColor:
              isSelected
                  ? const Color.fromARGB(0, 0, 0, 0)
                  : const Color.fromARGB(50, 16, 16, 16),
          icon: Icon(
            iconName,
            color: isSelected ? Colors.white : Colors.white.withAlpha(179),
            size: 18,
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
