import 'package:brain_am/widgets/TopLeftLogo.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:ui';
import 'package:url_launcher/url_launcher.dart';

Future<void> _launchURL(String url) async {
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $url');
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.03,
            left: MediaQuery.of(context).size.height * 0.03,
            child: TopLeftLogo(),
          ),
        ],
      ),
    );
  }
}



class SocialLink extends StatelessWidget {
  const SocialLink({super.key, required this.urlLink});
  final urlLink;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        try {
          await _launchURL('https://github.com/GithubAnant/');
        } catch (e) {
          // Handle the error, e.g., show a SnackBar or a dialog
          print('Error launching URL: $e');
        }
      },
      child: Text(
        '@GithubAnant',
        style: TextStyle(
          fontSize: 14,
          color: Colors.blueGrey,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
