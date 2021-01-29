import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:to_do_list/page/home/Homepage.dart';
import 'package:to_do_list/widget/CustomPaintRoute.dart';

void main() => runApp(new MyApp());

/// APP入口
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      //设置Android头部的导航栏透明
      SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
          statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.dark);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }

    return new MaterialApp(title: 'ToDoList', home: Homepage());
  }
}
