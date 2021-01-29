import 'package:flutter/material.dart';
import 'package:to_do_list/model/MonthModel.dart';
import 'package:to_do_list/value/MyColors.dart';

class MonthItem extends StatelessWidget {
  MonthModel _monthModel;

  MonthItem(this._monthModel);

  @override
  Widget build(BuildContext context) {
    //这个月中总的TODO
    var allRecordInMonth = _monthModel.dayRecordList.expand((e) => e.recordList).toList();

    //这个月中已完成的TODO
    var allDownListInMonth = allRecordInMonth.where((element) => element.isDone);

    //这个月的完成率
    var _monthProportion = allDownListInMonth.length / allRecordInMonth.length;

    return Column(
      children: [
        Text(
          _monthModel.monthValue.toString() + "月",
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
                          value: _monthProportion,
                          backgroundColor: MyColors.colorPrimary,
                        ),
                        Text(
                          (_monthProportion * 100).ceil().toString() + "%",
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
