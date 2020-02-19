import 'dart:math';

import 'package:flutter/material.dart';

class ColorPalette {
  static final ColorPalette primary = new ColorPalette(<Color>[
    Colors.green[400],
    Colors.green[200],
    Colors.green[600],
    Colors.green[800],
    Colors.green[100],
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