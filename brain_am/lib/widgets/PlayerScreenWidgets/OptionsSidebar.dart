import 'package:brain.am/screens/PlayerScreenMain.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:remixicon/remixicon.dart';

class OptionsSidebar extends StatelessWidget {
  const OptionsSidebar({super.key});

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
                IconSidebar(iconName: RemixIcons.home_2_line),
                IconSidebar(iconName: RemixIcons.music_2_line),
                IconSidebar(iconName: RemixIcons.time_line),
                IconSidebar(iconName: RemixIcons.hourglass_2_fill),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




class IconSidebar extends StatelessWidget {
  const IconSidebar({super.key, required this.iconName});

  final IconData iconName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.039),
      child: IconButton(
        hoverColor: const Color.fromARGB(255, 48, 48, 48),
        icon: Icon(iconName, color: Colors.white, size: 18),
        onPressed: () {},
      ),
    );
  } 
}
