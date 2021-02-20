import 'package:flutter/material.dart';
import 'package:to_do_list/model/MonthModel.dart';
import 'package:to_do_list/page/month_calendar/DayItem.dart';
import 'package:to_do_list/utils/DateUtil.dart';

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

    return Container(
        margin: const EdgeInsets.only(left: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _monthModel.monthValue.toString() + "月",
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            buildDayList()
          ],
        ));
  }

  Widget buildDayList() {
    return Container(
      margin: EdgeInsets.only(top: 8),
        child: GridView.builder(
            itemBuilder: (context, index) {
              return DayItem(_monthModel.dayRecordList[index]);
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7),
            shrinkWrap: true,
            physics: new NeverScrollableScrollPhysics(),
            itemCount: DateUtil.getDaysInMonth(_monthModel.yearValue, _monthModel.monthValue)));
  }
}
