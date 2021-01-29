import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/model/DayRecordModel.dart';
import 'package:to_do_list/value/MyColors.dart';

class DayItem extends StatelessWidget {
  DayRecordModel dayRecordModel;

  DayItem(this.dayRecordModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Stack(
        children: [
          CircularProgressIndicator(value: dayRecordModel.dayProportion),
          Text(
            (dayRecordModel.dayProportion * 100).ceil().toString() + "%",
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
