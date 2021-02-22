import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/model/DayRecordModel.dart';
import 'package:to_do_list/model/MonthModel.dart';
import 'package:to_do_list/model/RecordModel.dart';
import 'package:to_do_list/model/YearModel.dart';
import 'package:to_do_list/utils/DateUtil.dart';
import 'YearItem.dart';

class YearCalendarPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return YearCalenderState();
  }
}

class YearCalenderState extends State<YearCalendarPage> {
  static List<YearModel> yearList;

  @override
  Widget build(BuildContext context) {
    getGlobalDataList();
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
                    return YearItem(yearList[index]);
                  },
                  shrinkWrap: true, //解决无限高度问题
                  physics: new NeverScrollableScrollPhysics(),
                  itemCount: yearList.length),
            ],
          ),
          margin: const EdgeInsets.only(bottom: 122),
        ));
  }

  //获取所有记录数据
  getGlobalDataList() {
    var monthList = List<MonthModel>();
    for (int i = 1; i <= 12; i++) {
      var dayRecordListInMonth = List<DayRecordModel>();
      for (int j = 1; j <= DateUtil.getDaysInMonth(2021, i); j++) {
        var recordModelList = [
          RecordModel("2021年${i}月${j}日万事大吉！！！！！！！！！！！", DateTime(2021, i, j).millisecond, true),
          RecordModel("哈哈哈哈哈哈", DateTime(2021, i, j).millisecond, false),
          RecordModel("哈哈哈哈哈哈", DateTime(2021, i, j).millisecond, true)
        ];
        dayRecordListInMonth.add(DayRecordModel(2021, i, j, recordModelList));
      }
      monthList.add(MonthModel(2021, i, dayRecordListInMonth));
    }
    yearList = [YearModel(2021, monthList)];
  }

  //抛给全局使用的
  static List<YearModel> getYearListGlobal() {
    return yearList;
  }
}
