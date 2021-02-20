import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:to_do_list/model/YearModel.dart';
import 'package:to_do_list/page/calendar/CalendarPage.dart';
import 'MonthItem.dart';

class YearItem extends StatelessWidget {
  YearModel yearModel;

  YearItem(this.yearModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          buildTitle(yearModel),
          Container(margin: const EdgeInsets.only(top: 4), child: buildMonthList(yearModel))
        ],
      ),
      margin: const EdgeInsets.only(bottom: 24),
    );
  }

  Widget buildTitle(YearModel yearModel) {
    return Container(
        margin: const EdgeInsets.only(left: 8, right: 8, top: 32),
        alignment: AlignmentDirectional.centerStart,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(yearModel.yearValue.toString() + "年",
                style:
                    TextStyle(fontSize: 32, color: Colors.blueGrey, fontWeight: FontWeight.w700)),
            Divider(
              color: Color.fromARGB(6, 0, 0, 0),
              thickness: 2,
            )
          ],
        ));
  }

  Widget buildMonthList(YearModel yearModel) {
    return GridView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
            child: MonthItem(yearModel.monthList[index]),
            onTap: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return CalendarPage(title: "Calendar", monthModel: yearModel.monthList[index]);
              }))
            },
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        shrinkWrap: true,
        physics: new NeverScrollableScrollPhysics(),
        itemCount: yearModel.monthList.length);
  }
}
