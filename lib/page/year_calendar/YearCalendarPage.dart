import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/model/DayRecordModel.dart';
import 'package:to_do_list/model/MonthModel.dart';
import 'package:to_do_list/model/RecordModel.dart';
import 'package:to_do_list/model/YearModel.dart';
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
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: ListView(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 16, left: 16),
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
                  itemCount: _yearList.length),
            ],
          ),
          margin: const EdgeInsets.only(bottom: 122),
        ));
  }

  getYearList() {
    var recordModelList = [
      RecordModel("哈哈哈哈哈哈", DateTime.now().millisecondsSinceEpoch, true),
      RecordModel("哈哈哈哈哈哈", DateTime.now().millisecondsSinceEpoch, false),
      RecordModel("哈哈哈哈哈哈", DateTime.now().millisecondsSinceEpoch, true)
    ];

    var dayRecordList = List<DayRecordModel>();

    for (int i = 1; i <= 31; i++) {
      dayRecordList.add(DayRecordModel(2021, 1, i, recordModelList));
    }

    var monthList2021 = List<MonthModel>();
    for (int i = 1; i <= 12; i++) {
      monthList2021.add(MonthModel(2021, i, dayRecordList));
    }

    var monthList2020 = List<MonthModel>();

    for (int i = 1; i <= 12; i++) {
      monthList2020.add(MonthModel(2020, i, dayRecordList));
    }

    _yearList = [YearModel(2021, monthList2021), YearModel(2020, monthList2020)];
  }
}
