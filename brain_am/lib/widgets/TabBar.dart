import 'dart:ui';

import 'package:brain.am/widgets/ImageBox.dart';
import 'package:flutter/material.dart';

class TabBarDisplayWidget extends StatelessWidget {
  const TabBarDisplayWidget({super.key, required TabController tabController})
    : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        controller: _tabController,
        children: const [
          Center(
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  ImageBox(imagePath: 'assets/images/work1.png', description: 'Deep Work',),
                  ImageBox(imagePath: 'assets/images/work2.png', description: 'Lofi Beats',),
                ],
              ),
            ),
          ),
          Center(
            child: Text('Relax Sounds', style: TextStyle(color: Colors.white)),
          ),
          Center(
            child: Text('Focus Sounds', style: TextStyle(color: Colors.white)),
          ),
          Center(
            child: Text('Calm Sounds', style: TextStyle(color: Colors.white)),
          ),
          Center(
            child: Text(
              'Deep Think Sounds',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class TabBarCreate extends StatelessWidget {
  const TabBarCreate({super.key, required TabController tabController})
    : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.02,
        right: MediaQuery.of(context).size.width * 0.02,
        top: MediaQuery.of(context).size.height * 0.05,
      ),
      child: TabBar(
        controller: _tabController,
        isScrollable: true,
        tabAlignment: TabAlignment.start,

        // Styling to match the image
        labelColor: Color(0xFFD3BCA2), // Rose gold color
        unselectedLabelColor: Colors.white54,

        // Indicator styling
        indicatorColor: Color(0xFFD3BCA2), // Rose gold indicator
        indicatorWeight: 2, // Thin line
        indicatorPadding: EdgeInsets.symmetric(horizontal: 12),

        // Text styling
        labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),

        // Remove splash and highlight effects
        splashFactory: NoSplash.splashFactory,
        overlayColor: WidgetStatePropertyAll(Colors.transparent),

        tabs: const [
          Tab(text: 'Work'),
          Tab(text: 'Relax'),
          Tab(text: 'Focus'),
          Tab(text: 'Calm'),
          Tab(text: 'Deep Think'),
        ],
      ),
    );
  }
}
