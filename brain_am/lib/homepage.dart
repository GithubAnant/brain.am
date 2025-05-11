import 'package:flutter/material.dart';
import 'dart:ui';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
            right: -110,
            top: -10,
            bottom: -100,
            width: MediaQuery.of(context).size.width * 0.7,
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.topRight,
                  radius: 1.0,
                  colors: [
                    Colors.orange.withOpacity(0.7),
                    Colors.deepOrange.withOpacity(0.2),
                    Colors.transparent,
                  ],
                  stops: const [0.0, 0.5, 0.9],
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 70, sigmaY: 70),
                child: Container(color: Colors.transparent),
              ),
            ),
          ),
          // Blue gradient
          Positioned(
            right: -10,
            top: MediaQuery.of(context).size.height * 0.3,
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width * 0.6,
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.centerRight,
                  radius: 0.8,
                  colors: [
                    Colors.blue.withOpacity(0.6),
                    Colors.lightBlue.withOpacity(0.2),
                    Colors.transparent,
                  ],
                  stops: const [0.0, 0.5, 0.9],
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
                child: Container(color: Colors.transparent),
              ),
            ),
          ),
          // Content layer
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Logo on the left
                      Container(
                        child: Image.asset(
                          'assets/images/logo1.png',
                          height: 100,
                        ),
                      ),
                      
                      // Text and button on the right - enlarged
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          // Enlarged white text
                          Text(
                            "Text goes here",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontSize: 42,
                              fontWeight: FontWeight.bold,
                              
                            ),
                          ),
                          const SizedBox(height: 24),
                          // Enlarged white button with black text
                          ElevatedButton(
                            onPressed: () {
                              // Add your button action here
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              elevation: 8,
                              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 18),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              "Get Started",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}