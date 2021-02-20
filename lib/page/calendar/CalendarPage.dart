import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_calendar/constants/constants.dart';
import 'package:flutter_custom_calendar/controller.dart';
import 'package:flutter_custom_calendar/model/date_model.dart';
import 'package:flutter_custom_calendar/widget/calendar_view.dart';
import 'package:to_do_list/model/MonthModel.dart';
import 'package:to_do_list/model/RecordModel.dart';
import 'package:to_do_list/page/calendar/RecordItemInDay.dart';
import 'package:to_do_list/value/MyColors.dart';

class CalendarPage extends StatefulWidget {
  CalendarPage({Key key, this.title, this.monthModel}) : super(key: key);

  final String title;
  final MonthModel monthModel;

  @override
  _CalendarPageState createState() => _CalendarPageState(monthModel: monthModel);
}

class _CalendarPageState extends State<CalendarPage> {
  _CalendarPageState({this.monthModel}) : super();

  final MonthModel monthModel;
  CalendarController controller;
  CalendarViewWidget calendar;
  String _currentMonth = "视图";
  HashSet<DateTime> _selectedDate = new HashSet();
  HashSet<DateModel> _selectedModels = new HashSet();

  var currentShowingList = List<RecordModel>();

  GlobalKey<CalendarContainerState> _globalKey = new GlobalKey();

  @override
  void initState() {
    var now = DateTime.now();
    if (monthModel.yearValue == now.year && monthModel.monthValue == now.month)
      _selectedDate.add(now);
    var initDateModel = monthModel.yearValue == now.year && monthModel.monthValue == now.month
        ? DateModel.fromDateTime(now)
        : null;
    if (initDateModel != null) refreshRecordModelListInDay(initDateModel);
    controller = new CalendarController(
        minYear: 2019,
        minYearMonth: 1,
        maxYear: 2021,
        maxYearMonth: 12,
        selectDateModel: initDateModel,
        showMode: CalendarConstants.MODE_SHOW_ONLY_MONTH,
        selectedDateTimeList: _selectedDate,
        selectMode: CalendarSelectedMode.singleSelect)
      ..addOnCalendarSelectListener((dateModel) {
        _selectedModels.add(dateModel);
        refreshRecordModelListInDay(dateModel);
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
                      fontSize: 16,
                      color: model.isCurrentMonth
                          ? (_isSelected == false
                              ? (model.isWeekend ? Colors.black38 : Colors.black87)
                              : Colors.white)
                          : Colors.black38),
                ),
                Text(
                  model.lunarString,
                  style: TextStyle(
                      fontSize: 12,
                      color: model.isCurrentMonth
                          ? (_isSelected == false ? Colors.black38 : Colors.white)
                          : Colors.black38),
                )
//              Text(model.lunarDay.toString()),
              ],
            ),
          ),
        );
      },
    );
    //初始化Title
    _currentMonth = '${monthModel.yearValue} 年 ${monthModel.monthValue} 月';
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: MyColors.colorAccent,
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
                margin: EdgeInsets.only(top: 32),
                height: 400,
                child: ListView.builder(
                    itemBuilder: (context, index) {
                      return RecordItemInDay(recordModel: currentShowingList[index]);
                    },
                    itemCount: currentShowingList.length),
              ),
            )
          ],
        ),
      ),
    );
  }

  void refreshRecordModelListInDay(DateModel clickDate) {
    setState(() {
      currentShowingList = monthModel.dayRecordList
          .firstWhere((element) => clickDate.day == element.dayValue)
          .recordList;
    });
  }
}
