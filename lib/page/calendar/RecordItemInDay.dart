import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/model/RecordModel.dart';

class RecordItemInDay extends StatelessWidget {
  RecordItemInDay({this.recordModel});

  RecordModel recordModel;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 16, left: 16),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Container(
              margin: EdgeInsets.only(left: 8,top: 12,right: 16),
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                  color: recordModel.isDone ? Colors.green : Colors.red, shape: BoxShape.circle)),
          Expanded(
              child: Text(
            recordModel.content,
            maxLines: 30,
            style: TextStyle(fontSize: 18),
          )),
        ]));
  }
}
