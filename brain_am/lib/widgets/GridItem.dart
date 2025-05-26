import 'package:brain.am/screens/PlayerPageContainers/CategoryContainer.dart';
import 'package:brain.am/widgets/CategoryButton.dart';
import 'package:flutter/material.dart';

class GridItem extends StatefulWidget {
  final IconData icon;
  final String label;

  const GridItem({super.key, required this.icon, required this.label});

  @override
  State<GridItem> createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  bool isHovered = false;

  // void _showSnackbar() {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text('${widget.label} Mode Selected'),
  //       duration: const Duration(seconds: 1),
  //       backgroundColor: Colors.deepPurple,
  //       behavior: SnackBarBehavior.floating,
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(10),
  //       ),
  //     ),
  //   );
  // }

  void _showSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 10,
        content: Text(
          '${widget.label} Mood Selected',
          style: TextStyle(
            fontSize: 22,
            fontFamily: 'Montserrat',
            color: const Color.fromARGB(255, 181, 170, 170),
          ),
        ),
        duration: const Duration(seconds: 1),
        backgroundColor: const Color.fromARGB(180, 30, 30, 30),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        width: MediaQuery.of(context).size.width * 0.2,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showSnackbar,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: Container(
          margin: const EdgeInsets.only(top: 15),
          padding: const EdgeInsets.all(10),
          child: CategoryButton(
            isHovered: isHovered,
            icon: widget.icon,
            label: widget.label,
            onTap: _showSnackbar,
          ),
        ),
      ),
    );
  }
}
