import 'package:flutter/cupertino.dart';
import 'package:to_do_list/widget/MyPainter.dart';

class CustomPaintRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains){
          return CustomPaint(
            size: Size(constrains.maxWidth, constrains.maxHeight),
            painter: MyPainter(30),
          );
      },
    );
  }

}