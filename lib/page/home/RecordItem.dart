import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:to_do_list/model/RecordModel.dart';
import 'package:to_do_list/value/MyColors.dart';

/// 一条记录的Item
// ignore: must_be_immutable
class RecordCard extends StatelessWidget {
  RecordModel record;

  RecordCard(this.record);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: MyColors.colorPrimary, borderRadius: BorderRadius.circular(10)),
                width: 36,
                height: 36,
              ),
              Container(
                child: Image.asset(
                  'images/icon_down_2.png',
                  scale: 6,
                  color: MyColors.colorAccent,
                ),
                margin: const EdgeInsets.only(left: 8),
              )
            ],
            alignment: Alignment.center,
          ),
          Expanded(
              child: Stack(
            children: [
              Container(
                child: Text(record.content,
                    style: TextStyle(
                      fontSize: 16,
                      color: MyColors.colorAccent,
                      decoration: record.isDone ? TextDecoration.lineThrough : null,
                      decorationStyle: TextDecorationStyle.solid,
                      decorationThickness: 4,
                      decorationColor: MyColors.colorAccent,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
                margin: const EdgeInsets.only(left: 8),
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                decoration: BoxDecoration(
                    gradient:
                        LinearGradient(colors: [MyColors.colorPrimary, MyColors.colorPrimaryHalf]),
                    borderRadius: BorderRadius.circular(10)),
              )
            ],
          )),
        ],
        mainAxisAlignment: MainAxisAlignment.start,
      ),
      margin: const EdgeInsets.only(left: 32, right: 48, bottom: 8),
    );
  }
}
