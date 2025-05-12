import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.03,
          vertical: MediaQuery.of(context).size.height * 0.019,
        ),
        child: Text(
          'brain.am',
          textAlign: TextAlign.start,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 24,
            letterSpacing: 0.5, // adds spaciousness
            color: const Color.fromARGB(255, 255, 230, 202),
          ),
        ),
      ),
    );
  }
}
