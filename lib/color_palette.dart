import 'dart:math';

import 'package:flutter/material.dart';

class ColorPalette {
  static final ColorPalette primary = new ColorPalette(<Color>[
    Colors.blue[400],
    Colors.blue[200],
    Colors.green[400],
    Colors.green[200],
    Colors.yellow[200],
    Colors.orange[200],
    Colors.teal[400],
    Colors.teal[200]
  ]);

  ColorPalette(List<Color> colors) : _colors = colors {
    assert(colors.isNotEmpty);
  }

  final List<Color> _colors;

  Color operator [](int index) => _colors[index % length];

  int get length => _colors.length;

  Color random(Random random) => this[random.nextInt(length)];
}