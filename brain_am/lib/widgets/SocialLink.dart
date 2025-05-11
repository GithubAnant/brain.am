import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> _launchURL(String url) async {
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $url');
  }
}

class SocialLink extends StatelessWidget {
  const SocialLink({super.key, required this.urlLink});
  final String urlLink;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        try {
          await _launchURL('https://github.com/GithubAnant/');
        } catch (e) {
          // Handle the error, e.g., show a SnackBar or a dialog
          // ignore: avoid_print
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
