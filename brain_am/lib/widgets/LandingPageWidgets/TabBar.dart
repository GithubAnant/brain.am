import 'dart:ui';

import 'package:brain.am/widgets/LandingPageWidgets/ImageBox.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TabBarDisplayWidget extends StatelessWidget {
  TabBarDisplayWidget({super.key, required TabController tabController})
    : _tabController = tabController;

  final TabController _tabController;

List<ImageBox> workImageBoxes = [
  ImageBox(imagePath: 'assets/images/LandingPageImages/work1.png', description: 'Deep Work'),
  ImageBox(imagePath: 'assets/images/LandingPageImages/work2.png', description: 'Lofi Beats'),
  ImageBox(imagePath: 'assets/images/LandingPageImages/work3.png', description: 'Coding'),
];

List<ImageBox> chillImageBoxes = [
  ImageBox(imagePath: 'assets/images/LandingPageImages/chill1.png', description: 'Instrumental'),
  ImageBox(imagePath: 'assets/images/LandingPageImages/chill2.png', description: 'Upbeat'),
  ImageBox(imagePath: 'assets/images/LandingPageImages/chill3.png', description: 'Vintage'),
];

List<ImageBox> sleepImageBoxes = [
  ImageBox(imagePath: 'assets/images/LandingPageImages/sleep1.png', description: 'Rain Sounds'),
  ImageBox(imagePath: 'assets/images/LandingPageImages/sleep2.png', description: 'Ambient'),
];

List<ImageBox> studyImageBoxes = [
  ImageBox(imagePath: 'assets/images/LandingPageImages/study1.png', description: 'Rainforest'),
  ImageBox(imagePath: 'assets/images/LandingPageImages/study2.png', description: 'Electronic'),
  ImageBox(imagePath: 'assets/images/LandingPageImages/study3.png', description: 'Underwater'),
];

List<ImageBox> focusImageBoxes = [
  ImageBox(imagePath: 'assets/images/LandingPageImages/focus1.png', description: 'Concentrate'),
  ImageBox(imagePath: 'assets/images/LandingPageImages/focus2.png', description: 'Post Rock'),
];


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        controller: _tabController,
        children: [
          
          RowImageBox(ImageBoxes: workImageBoxes),
          RowImageBox(ImageBoxes: chillImageBoxes),
          RowImageBox(ImageBoxes: sleepImageBoxes),
          RowImageBox(ImageBoxes: studyImageBoxes),
          RowImageBox(ImageBoxes: focusImageBoxes),
          
        ],
      ),
    );
  }
}



class RowImageBox extends StatelessWidget {
  const RowImageBox({
    super.key,
    required this.ImageBoxes,
  });

  final List<ImageBox> ImageBoxes;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Row(
          children: ImageBoxes
        ),
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
          Tab(text: 'Chill'),
          Tab(text: 'Sleep'),
          Tab(text: 'Study'),
          Tab(text: 'Focus'),
        ],
      ),
    );
  }
}
