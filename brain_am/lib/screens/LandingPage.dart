import 'package:brain.am/widgets/DemoImage.dart';
import 'package:brain.am/widgets/HeroText.dart';
import 'package:brain.am/widgets/StartListeningButton.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class BrainAMHome extends StatelessWidget {
  const BrainAMHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'brain.am',
          style: TextStyle(color: const Color.fromARGB(146, 77, 77, 77)),
        ),
        centerTitle: false,
      ),

      backgroundColor: const Color.fromARGB(0, 0, 0, 0),
      body: Stack(
        children: [
      
          //backdrop
          Positioned.fill(
            child: Image.asset('assets/images/1.png', fit: BoxFit.cover),
          ),
      
      
          //tint
          Positioned.fill(child: Container(color: Colors.black.withAlpha(150))),
      
          Center(
            child: Column(
              
              children: [
                SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(width: 30),
      
                    DemoImage(),
      
                    const SizedBox(width: 60),
      
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
      
                      children: [
                        HeroText(),
                        const SizedBox(height: 30),
                        StartListeningButton(),
                      ],
                    ),
      
                    const SizedBox(width: 20),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
