import 'package:brain.am/screens/PlayerPageContainers/CategoryContainer.dart';
import 'package:brain.am/widgets/CategoryButton.dart';
import 'package:flutter/material.dart';

class GridItem extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const GridItem({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  State<GridItem> createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
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
          onTap: widget.onTap,
        ),
      ),
    );
  }
}
