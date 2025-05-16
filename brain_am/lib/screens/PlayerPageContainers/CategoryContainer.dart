// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_print

import 'package:brain.am/screens/PlayerPageContainers/HomeContainer.dart';
import 'package:brain.am/widgets/GridItem.dart';
import 'package:brain.am/widgets/GridTable.dart';
import 'package:brain.am/widgets/PlayerContainerBackgroundImage.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:remixicon/remixicon.dart';

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({super.key});

  @override
  Widget build(BuildContext context) {
    double containerWidth = MediaQuery.of(context).size.width * 0.66;
    double containerHeight = MediaQuery.of(context).size.height * 0.8;
    return Positioned(
      left: MediaQuery.of(context).size.width * 0.18,
      top: MediaQuery.of(context).size.height * 0.08,
      child: Stack(
        children: [
          BackgroundImage(
            containerWidth: containerWidth,
            containerHeight: containerHeight,
          ),

          GlassmorphicContainer(
            width: containerWidth,
            height: containerHeight,
            borderRadius: 15,
            linearGradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color.fromARGB(255, 255, 255, 255).withAlpha(20),
                const Color.fromARGB(255, 255, 255, 255).withAlpha(13),
              ],
            ),
            border: 0.3,
            blur: 0.5,
            borderGradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color.fromARGB(255, 201, 201, 201),
                const Color.fromARGB(210, 194, 194, 194),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),

                  const Text(
                    "Pick A Mood",
                    style: TextStyle(
                      fontSize: 36,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),

                  GridTable(),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
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