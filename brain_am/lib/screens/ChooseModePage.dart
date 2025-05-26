import 'package:brain.am/widgets/ChooseModeScreenWidgets/FocusGlassContainer.dart';
import 'package:brain.am/widgets/ChooseModeScreenWidgets/SmallGlassMorphContainer.dart';
import 'package:brain.am/widgets/SocialLink.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';

// dead code. not used anywhere

class ChooseModePage extends StatelessWidget {
  const ChooseModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.arrow_back, color: Colors.white70,)),
      ),
      body: Stack(
        children: [
          //backdrop
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),


          Column(
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
                      ),
                      SmallGlassMorphContainer(
                        text: 'Sleep',),
                      SmallGlassMorphContainer(
                        text: 'Study'
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
