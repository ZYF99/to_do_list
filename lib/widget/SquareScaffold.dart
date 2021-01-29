
import 'package:flutter/material.dart';

import 'CustomPaintRoute.dart';

class SquareScaffoldUtil{
  static buildSquareScaffold(Widget child){
    return Scaffold(body: Container(child: Stack(children: [CustomPaintRoute(), child])));
  }
}