import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/model/RecordModel.dart';

class RecordItemInDay extends StatelessWidget {
  RecordItemInDay({this.recordModel});

  RecordModel recordModel;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 16),
        child: Row(children: [
          Container(
              margin: EdgeInsets.all(8),
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                  color: recordModel.isDone ? Colors.greenAccent : Colors.redAccent,
                  shape: BoxShape.circle)),
          SizedBox(
            width: 1,
            height: 24,
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.black),
            ),
          ),
          Container(
            child: Text(
              recordModel.content,
              style: TextStyle(fontSize: 18),
            ),
            margin: EdgeInsets.only(left: 16),
          )
        ]));
  }
}
