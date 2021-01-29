import 'package:flutter/cupertino.dart';
import 'package:to_do_list/model/MonthModel.dart';

import 'DayItem.dart';

class MonthCalendarPage extends StatefulWidget {

  MonthModel _monthModel;

  MonthCalendarPage(this._monthModel);

  @override
  State<StatefulWidget> createState() {
    return MonthCalendarState(_monthModel);
  }

}

class MonthCalendarState extends State<MonthCalendarPage> {

  MonthModel _monthModel;

  MonthCalendarState(this._monthModel);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemBuilder: (context, index) {
          return DayItem(_monthModel.dayRecordList[index]);
        },
        shrinkWrap: true,
        //解决无限高度问题
        physics: new NeverScrollableScrollPhysics(),
        itemCount: _monthModel.dayRecordList.length);
  }

}