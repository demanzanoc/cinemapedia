import 'package:flutter/material.dart';

class CustomBackgroundGradient extends StatelessWidget {
  const CustomBackgroundGradient({
    super.key,
    this.begin = Alignment.centerLeft,
    this.end = Alignment.centerRight,
    required this.stops,
    required this.colors,
  });

  final AlignmentGeometry begin;
  final AlignmentGeometry end;
  final List<double> stops;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: begin,
            end: end,
            stops: stops,
            colors: colors,
          ),
        ),
      ),
    );
  }
}
