import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/Component/ButtonWithTextWidget.dart';
import 'package:to_do_list/page/home/DailyListPage.dart';
import 'package:to_do_list/page/week/WeekProportionPage.dart';
import 'package:to_do_list/page/year_calendar/YearCalendarPage.dart';
import 'package:to_do_list/widget/CustomPaintRoute.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainPageState();
  }
}

class MainPageState extends State<MainPage> {
  int _index = 0;
  final PageController _pageController = PageController(initialPage: 2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Stack(children: [
      CustomPaintRoute(),
      PageView.builder(
        itemBuilder: (BuildContext context, int index) {
          print("build page for index = $index");
          switch (index) {
            case 0:
              return YearCalendarPage();
            case 1:
              return WeekProportionPage();
            case 2:
              return DailyListPage();
          }
          return DailyListPage();
        },
        itemCount: 3,
        onPageChanged: (index) async {
          print("on page changed event: index = $index");
          setState(() {
            _index = index;
          });
        },
        controller: _pageController,
      ),
      Positioned(
        child: buildBottomNavigationBar(_pageController),
        bottom: 16,
        left: 32,
        right: 32,
      )
    ])));
  }
}

Widget buildBottomNavigationBar(PageController _pageController) {
  return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          GestureDetector(
            onTap: () => {_pageController.jumpToPage(0)},
            child: ButtonWithTextWidget(Icons.calendar_today, 'Calendar'),
          ),
          GestureDetector(
            onTap: () => {_pageController.jumpToPage(1)},
            child: ButtonWithTextWidget(Icons.view_week, 'Weekly\nproportion'),
          ),
          GestureDetector(
            onTap: () => {_pageController.jumpToPage(2)},
            child: ButtonWithTextWidget(Icons.calendar_view_day, 'Daily list'),
          )
        ],
      ));
}
