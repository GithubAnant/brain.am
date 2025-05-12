import 'package:brain.am/widgets/HeaderText.dart';
import 'package:brain.am/widgets/HeroText.dart';
import 'package:brain.am/widgets/StartListeningButton.dart';
import 'package:flutter/material.dart';

class MainContainerContent extends StatelessWidget {
  const MainContainerContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderText(),
        
        SizedBox(height: 10),
        
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.43,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeroText(text: "Sounds For \nEverything You Do"),
                SizedBox(height: 25),
                StartListeningButton(),
              ],
            ),
          ],
        ),
      ],
    );
  }
}