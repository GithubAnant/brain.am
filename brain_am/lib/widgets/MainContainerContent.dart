import 'package:brain.am/widgets/HeaderText.dart';
import 'package:brain.am/widgets/HeroText.dart';
import 'package:brain.am/widgets/StartListeningButton.dart';
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
        Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.02, vertical: MediaQuery.of(context).size.height*0.05),
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
            labelStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            
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
        ),

        // TabBar View
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const [
              Center(child: Text('Work Sounds', style: TextStyle(color: Colors.white))),
              Center(child: Text('Relax Sounds', style: TextStyle(color: Colors.white))),
              Center(child: Text('Focus Sounds', style: TextStyle(color: Colors.white))),
              Center(child: Text('Calm Sounds', style: TextStyle(color: Colors.white))),
              Center(child: Text('Deep Think Sounds', style: TextStyle(color: Colors.white))),
            ],
          ),
        ),
      ],
    );
  }
}