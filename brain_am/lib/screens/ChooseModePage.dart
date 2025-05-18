import 'package:brain.am/widgets/ChooseModeScreenWidgets/FocusGlassContainer.dart';
import 'package:brain.am/widgets/ChooseModeScreenWidgets/SmallGlassMorphContainer.dart';
import 'package:brain.am/widgets/SocialLink.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';

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
          Positioned.fill(child: Container(color: Colors.black.withAlpha(50))),
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
                        startColor: Color(0xFFFF6B6B).withAlpha(77),
                        endColor: Color(0xFFFFE66D).withAlpha(51),
                      ),
                      SmallGlassMorphContainer(
                        text: 'Sleep',
                        startColor: Color.fromARGB(
                          255,
                          64,
                          28,
                          142,
                        ).withAlpha(77),
                        endColor: Color(0xFF9B51E0).withAlpha(51),
                      ),
                      SmallGlassMorphContainer(
                        text: 'Study',
                        startColor: Color(0xFFB8E986).withAlpha(77),
                        endColor: Color(0xFF62D2A2).withAlpha(51),
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
