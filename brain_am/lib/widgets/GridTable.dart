import 'package:brain.am/widgets/GridItem.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class GridTable extends StatelessWidget {
  const GridTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(
              children: [
                GridItem(icon: RemixIcons.focus_2_line, label: "Focus", onTap: (){}),
                GridItem(icon: RemixIcons.zzz_line, label: "Sleep", onTap: (){})
              ],
            ),
            TableRow(
              children: [
                GridItem(icon: RemixIcons.book_open_line, label: "Study", onTap: (){}),
                GridItem(icon: RemixIcons.sofa_line, label: "Relax", onTap: (){}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

