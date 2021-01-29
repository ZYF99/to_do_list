import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPainter extends CustomPainter {
  int squareWidth = 40;

  MyPainter(this.squareWidth);

  @override
  void paint(Canvas canvas, Size size) {
    double eWidth = squareWidth.toDouble();
    double eHeight = squareWidth.toDouble();

    //行数
    int lines = size.height ~/ squareWidth;

    //列数
    int rows = size.width ~/ squareWidth;

    //画棋盘背景
    var paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill //填充
      ..color = Color.fromRGBO(232, 220, 186, 0.4); //背景为纸黄色
    canvas.drawRect(Offset.zero & size, paint);

    //画棋盘网格
    paint
      ..style = PaintingStyle.stroke //线
      ..color = Colors.black12
      ..strokeWidth = 1.0;

    for (int i = 0; i <= lines; ++i) {
      double dy = eHeight * i;
      canvas.drawLine(Offset(0, dy), Offset(size.width, dy), paint);
    }

    for (int i = 0; i <= rows; ++i) {
      double dx = eWidth * i;
      canvas.drawLine(Offset(dx, 0), Offset(dx, size.height), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
