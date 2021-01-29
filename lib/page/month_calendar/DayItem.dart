import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/model/DayRecordModel.dart';
import 'package:to_do_list/value/MyColors.dart';

class DayItem extends StatelessWidget {
  DayRecordModel dayRecordModel;

  DayItem(this.dayRecordModel);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          dayRecordModel.dayValue.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: "adam_gorry_lights", fontSize: 24),
        ),
        Expanded(
            child: ClipRRect(
                child: Container(
                    width: 120,
                    child: Stack(
                      children: [
                        CircularProgressIndicator(
                          value: dayRecordModel.dayProportion,
                          backgroundColor: MyColors.colorPrimary,
                        ),
                        Text(
                          (dayRecordModel.dayProportion * 100).ceil().toString() + "%",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                      alignment: Alignment.center,
                    ),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(color: MyColors.colorAccentHalf)),
                borderRadius: BorderRadius.circular(10))),
      ],
    );
  }
}
