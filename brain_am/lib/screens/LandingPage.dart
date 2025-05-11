import 'package:flutter/material.dart';

class BrainAMHome extends StatelessWidget {
  const BrainAMHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(0, 0, 0, 0),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/images/1.png', fit: BoxFit.cover,),
          ),
          Positioned.fill(child: Container(
            color: Colors.black.withAlpha(150),
          )),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Phone UI Mock
                DemoWidget(),
                const SizedBox(width: 60),
                // Right Text Section
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
          ),
        ],
      ),
    );
  }
}

class DemoWidget extends StatelessWidget {
  const DemoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: BoxDecoration(
        color: const Color(0xFF12171D),
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 30),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Placeholder(
        fallbackWidth: MediaQuery.of(context).size.width * 0.3,
        fallbackHeight: MediaQuery.of(context).size.height * 0.2,
      ),
    );
  }
}

class HeroText extends StatelessWidget {
  const HeroText({super.key});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return const RadialGradient(
          center: Alignment.topLeft,
          radius: 2,
          colors: [Colors.white, Color.fromARGB(217, 114, 114, 114)],
        ).createShader(bounds);
      },
      child: Text(
        'Sounds for\neverything',
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.width*0.05,
          fontWeight: FontWeight.bold,
          color: Colors.white,
           shadows: [
            Shadow(
              offset: Offset(2.0, 2.0),
              blurRadius: 12.0,
              color: Colors.black.withOpacity(0.25),
            ),
          ],
        ),
      ),
    );
  }
}

class StartListeningButton extends StatelessWidget {
  const StartListeningButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white.withOpacity(0.1),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text('Start Listening', style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.015)),
    );
  }
}
