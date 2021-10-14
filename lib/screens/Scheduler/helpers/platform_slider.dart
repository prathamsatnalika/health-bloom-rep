import 'package:flutter/material.dart';
import 'dart:io';

class PlatformSlider extends StatelessWidget {
  final int ? min, max, divisions, value;
  final Function ? handler;
  final Color ? color;

  PlatformSlider(
      { this.value,
        this.handler,
        this.color,
        this.max,
        this.min,
        this.divisions});

  @override
  Widget build(BuildContext context) {
    return Slider(
            value: this.value!.toDouble(),
            onChanged: (value) => this.handler!(value),
            max: this.max!.toDouble(),
            min: this.min!.toDouble(),
            divisions: this.divisions,
            activeColor: this.color,
          );
  }
}
