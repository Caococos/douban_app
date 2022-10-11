import 'package:flutter/material.dart';
class ZHDashedLine extends StatelessWidget {
  final Axis axis;
  final double dashedLength;
  final double dashedWidth;
  final int count;
  final Color color;
  const ZHDashedLine({
    super.key,
    this.axis = Axis.horizontal,
    this.dashedLength = 8,
    this.dashedWidth = 1,
    this.count = 10,
    this.color = const Color(0xff888888)
});

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: axis,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(count, (index) {
        return Container(
          width: axis == Axis.horizontal ? dashedLength : dashedWidth,
          height: axis == Axis.horizontal ? dashedWidth : dashedLength,
          color: color,
      );
      }),
    );
  }
}
