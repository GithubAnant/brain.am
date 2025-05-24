// import 'package:flutter/material.dart';

// final String songName = "Semicolon";
// final String songType = "Post Rock";

// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //

// class SongNameAndSubtext1 extends StatefulWidget {
//   const SongNameAndSubtext1({
//     super.key,
//     required this.screenWidth,
//     required this.screenHeight,
//   });

//   final double screenWidth;
//   final double screenHeight;

//   @override
//   State<SongNameAndSubtext1> createState() => _SongNameAndSubtext1State();
// }

// class _SongNameAndSubtext1State extends State<SongNameAndSubtext1> {
//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       left: widget.screenWidth * 0.025,
//       top: widget.screenHeight * 0.04,
//       child: Row(
//         children: [
//           // Album art
//           Container(
//             width: 36,
//             height: 36,
//             decoration: BoxDecoration(
//               color: Colors.grey[300],
//               borderRadius: BorderRadius.circular(6),
//             ),
//             child: const Center(
//               child: Icon(Icons.music_note, size: 20, color: Colors.grey),
//             ),
//           ),
//           const SizedBox(width: 12),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 songName,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 14,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               Text(
//                 songType,
//                 style: TextStyle(
//                   color: Colors.grey,
//                   fontSize: 12,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //

// class SongNameAndSubtext2 extends StatefulWidget {
//   const SongNameAndSubtext2({
//     super.key,
//     required this.screenWidth,
//     required this.screenHeight,
//   });

//   final double screenWidth;
//   final double screenHeight;

//   @override
//   State<SongNameAndSubtext2> createState() => _SongNameAndSubtext2State();
// }

// class _SongNameAndSubtext2State extends State<SongNameAndSubtext2> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           songName,
//           style: const TextStyle(
//             fontFamily: 'Montserrat',
//             color: Colors.white,
//             fontSize: 40,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         const SizedBox(height: 3), // Reduced space
//         Text(
//           songType,
//           style: const TextStyle(
//             fontFamily: 'Montserrat',
//             color: Color.fromARGB(121, 255, 255, 255),
//             fontSize: 22, // 2% increase from 20
//             fontWeight: FontWeight.w400,
//           ),
//         ),
//       ],
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:brain.am/constants/globals.dart' as globals;

class SongNameAndSubtext1 extends StatelessWidget {
  const SongNameAndSubtext1({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: screenWidth * 0.025,
      top: screenHeight * 0.04,
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Center(
              child: Icon(Icons.music_note, size: 20, color: Colors.grey),
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ValueListenableBuilder<String>(
                valueListenable: globals.songTitle,
                builder: (context, title, _) => Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              ValueListenableBuilder<String>(
                valueListenable: globals.songType,
                builder: (context, type, _) => Text(
                  type,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class SongNameAndSubtext2 extends StatelessWidget {
  const SongNameAndSubtext2({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ValueListenableBuilder<String>(
          valueListenable: globals.songTitle,
          builder: (context, title, _) => Text(
            title,
            style: const TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 3),
        ValueListenableBuilder<String>(
          valueListenable: globals.songType,
          builder: (context, type, _) => Text(
            type,
            style: const TextStyle(
              fontFamily: 'Montserrat',
              color: Color.fromARGB(121, 255, 255, 255),
              fontSize: 22,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
