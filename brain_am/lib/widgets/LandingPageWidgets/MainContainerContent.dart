import 'package:brain.am/widgets/LandingPageWidgets/HeaderText.dart';
import 'package:brain.am/widgets/LandingPageWidgets/HeroText.dart';
import 'package:brain.am/widgets/LandingPageWidgets/StartListeningButton.dart';
import 'package:brain.am/widgets/LandingPageWidgets/TabBar.dart';
import 'package:flutter/material.dart';

class MainContainerContent extends StatefulWidget {
  const MainContainerContent({super.key});

  @override
  State<MainContainerContent> createState() => _MainContainerContentState();
}

class _MainContainerContentState extends State<MainContainerContent> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderText(),

        SizedBox(height: MediaQuery.of(context).size.height * 0.07),

        Row(
          children: [
            SizedBox(width: MediaQuery.of(context).size.width * 0.43),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeroText(text: "Sounds For \nEverything You Do"),
                SizedBox(height: 21),
                StartListeningButton(),
              ],
            ),
          ],
        ),

        // Tabs styled like the image
        TabBarCreate(tabController: _tabController),

        // TabBar View
        TabBarDisplayWidget(tabController: _tabController),
      ],
    );
  }
}
