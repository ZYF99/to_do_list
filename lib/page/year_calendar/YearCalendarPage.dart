import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/model/DayRecordModel.dart';
import 'package:to_do_list/model/MonthModel.dart';
import 'package:to_do_list/model/RecordModel.dart';
import 'package:to_do_list/model/YearModel.dart';
import 'package:to_do_list/widget/SquareScaffold.dart';

import 'YearItem.dart';

class YearCalendarPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return YearCalenderState();
  }
}

class YearCalenderState extends State<YearCalendarPage> {
  List<YearModel> _yearList;

  @override
  Widget build(BuildContext context) {
    getYearList();
    return SquareScaffoldUtil.buildSquareScaffold(ListView(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 16,left: 16),
          child: Text("Calendar",
              style: TextStyle(
                fontSize: 64,
                fontFamily: 'orangejuice',
                color: Colors.blueGrey,
                backgroundColor: Colors.transparent,
              )),
        ),
        ListView.builder(
            itemBuilder: (context, index) {
              return YearItem(_yearList[index]);
            },
            shrinkWrap: true, //解决无限高度问题
            physics: new NeverScrollableScrollPhysics(),
            itemCount: _yearList.length)
      ],
    ));
  }

  getYearList() {
    var recordModelList = [
      RecordModel("哈哈哈哈哈哈", DateTime.now().millisecondsSinceEpoch, true),
      RecordModel("哈哈哈哈哈哈", DateTime.now().millisecondsSinceEpoch, false),
      RecordModel("哈哈哈哈哈哈", DateTime.now().millisecondsSinceEpoch, true)
    ];

    var dayRecordList = [
      DayRecordModel(1, recordModelList),
      DayRecordModel(2, recordModelList),
      DayRecordModel(3, recordModelList),
      DayRecordModel(4, recordModelList),
      DayRecordModel(5, recordModelList),
      DayRecordModel(1, recordModelList),
      DayRecordModel(2, recordModelList),
      DayRecordModel(3, recordModelList),
      DayRecordModel(4, recordModelList),
      DayRecordModel(5, recordModelList),
      DayRecordModel(1, recordModelList),
      DayRecordModel(2, recordModelList),
      DayRecordModel(3, recordModelList),
      DayRecordModel(4, recordModelList),
      DayRecordModel(5, recordModelList),
      DayRecordModel(1, recordModelList),
      DayRecordModel(2, recordModelList),
      DayRecordModel(3, recordModelList),
      DayRecordModel(4, recordModelList),
      DayRecordModel(5, recordModelList),
      DayRecordModel(1, recordModelList),
      DayRecordModel(2, recordModelList),
      DayRecordModel(3, recordModelList),
      DayRecordModel(4, recordModelList),
      DayRecordModel(5, recordModelList),
    ];

    var monthList2021 = [
      MonthModel(1, dayRecordList),
    ];

    var monthList2020 = [
      MonthModel(1, dayRecordList),
      MonthModel(2, dayRecordList),
      MonthModel(3, dayRecordList),
      MonthModel(4, dayRecordList),
      MonthModel(5, dayRecordList),
      MonthModel(6, dayRecordList),
      MonthModel(7, dayRecordList),
      MonthModel(8, dayRecordList),
      MonthModel(9, dayRecordList),
      MonthModel(10, dayRecordList),
      MonthModel(11, dayRecordList),
      MonthModel(12, dayRecordList)
    ];

    _yearList = [
      YearModel(2021, monthList2021),
      YearModel(2020, monthList2020)
    ];
  }
}
