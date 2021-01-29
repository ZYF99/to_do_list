import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_calendar/constants/constants.dart';
import 'package:flutter_custom_calendar/controller.dart';
import 'package:flutter_custom_calendar/model/date_model.dart';
import 'package:flutter_custom_calendar/widget/calendar_view.dart';
import 'package:to_do_list/value/MyColors.dart';

class CalendarPage extends StatefulWidget {
  CalendarPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarController controller;
  CalendarViewWidget calendar;
  String _currentMonth = "视图";
  HashSet<DateTime> _selectedDate = new HashSet();
  HashSet<DateModel> _selectedModels = new HashSet();

  GlobalKey<CalendarContainerState> _globalKey = new GlobalKey();

  @override
  void initState() {
    _selectedDate.add(DateTime.now());
    controller = new CalendarController(
        minYear: 2019,
        minYearMonth: 1,
        maxYear: 2021,
        maxYearMonth: 12,
        showMode: CalendarConstants.MODE_SHOW_ONLY_MONTH,
        selectedDateTimeList: _selectedDate,
        selectMode: CalendarSelectedMode.singleSelect)
      ..addOnCalendarSelectListener((dateModel) {
        _selectedModels.add(dateModel);
      });
    calendar = new CalendarViewWidget(
      key: _globalKey,
      calendarController: controller,
      dayWidgetBuilder: (DateModel model) {
        double wd = (MediaQuery.of(context).size.width - 20) / 7;
        bool _isSelected = model.isSelected;
        if (_isSelected &&
            CalendarSelectedMode.singleSelect == controller.calendarConfiguration.selectMode) {
          //_selectDate = model.toString();
        }
        return ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(wd / 2)),
          child: Container(
            color: _isSelected ? Theme.of(context).focusColor : Colors.white,
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  model.day.toString(),
                  style: TextStyle(
                      color: model.isCurrentMonth
                          ? (_isSelected == false
                              ? (model.isWeekend ? Colors.black38 : Colors.black87)
                              : Colors.white)
                          : Colors.black38),
                ),
//              Text(model.lunarDay.toString()),
              ],
            ),
          ),
        );
      },
    );
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.addMonthChangeListener((year, month) {
        setState(() {
          _currentMonth = '$year 年 $month 月';
        });
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: MyColors.colorPrimary,
        title: Text(_currentMonth),
      ),
      body: CupertinoScrollbar(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: calendar,
            ),
            SliverToBoxAdapter(
              child: Container(
                /*child: Text(
                  ' $_selectDate ',
                  style: TextStyle(color: Theme.of(context).focusColor),
                ),*/
              ),
            )
          ],
        ),
      ),
    );
  }


}
