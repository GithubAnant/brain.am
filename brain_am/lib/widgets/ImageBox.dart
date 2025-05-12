// import 'package:flutter/material.dart';

// class ImageBox extends StatelessWidget {
//   const ImageBox({
//     super.key, 
//     required this.imagePath, 
//     required this.description
//   });

//   final String imagePath;
//   final String description;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           height: MediaQuery.of(context).size.height * 0.23,
//           width: MediaQuery.of(context).size.width * 0.15,
//           margin: const EdgeInsets.only(left: 20, right: 10, top: 30),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(13),
//             boxShadow: [
//               BoxShadow(
//                 color: const Color.fromARGB(181, 23, 22, 22).withAlpha(77),
//                 spreadRadius: 2,
//                 blurRadius: 10,
//                 offset: const Offset(0, 4),
//               ),
//             ],
//           ),
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(13),  
//             child: Image.asset(imagePath, fit: BoxFit.cover),
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.only(
//             left: 25, 
//             top: 15,
//           ),
//           child: Text(
//             description,
//             style: TextStyle(
//               color: Color.fromARGB(255, 255, 233, 208), // Rose gold color
//               fontSize: MediaQuery.of(context).size.width * 0.012,
//               fontFamily: 'Montserrat'
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';

class ImageBox extends StatefulWidget {
  const ImageBox({
    super.key,
    required this.imagePath,
    required this.description,
  });

  final String imagePath;
  final String description;

  @override
  State<ImageBox> createState() => _ImageBoxState();
}

class _ImageBoxState extends State<ImageBox> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    double baseHeight = MediaQuery.of(context).size.height * 0.23;
    double baseWidth = MediaQuery.of(context).size.width * 0.15;
    double scale = _isHovered ? 1.03 : 1.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            height: baseHeight * scale,
            width: baseWidth * scale,
            margin: const EdgeInsets.only(left: 20, right: 10, top: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(181, 23, 22, 22).withAlpha(77),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(13),
              child: Image.asset(widget.imagePath, fit: BoxFit.cover),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25, top: 15),
          child: Text(
            widget.description,
            style: TextStyle(
              color: const Color.fromARGB(255, 255, 233, 208),
              fontSize: MediaQuery.of(context).size.width * 0.012,
              fontFamily: 'Montserrat',
            ),
          ),
        ),
      ],
    );
  }
}
