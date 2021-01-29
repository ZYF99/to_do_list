import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:to_do_list/model/YearModel.dart';
import 'MonthItem.dart';

class YearItem extends StatelessWidget {
  YearModel yearModel;

  YearItem(this.yearModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [buildTitle(yearModel), buildMonthList(yearModel)],
      ),
      margin: const EdgeInsets.only(bottom: 32),
    );
  }

  Widget buildTitle(YearModel yearModel) {
    return Container(
      margin: const EdgeInsets.only(left: 6),
      alignment: AlignmentDirectional.centerStart,
        child: Text(yearModel.yearValue.toString(),
            style: TextStyle(
              fontSize: 32,
              color: Colors.blueGrey,
              fontFamily: "adam_gorry_lights",
              decoration: TextDecoration.underline,
            )));
  }

  Widget buildMonthList(YearModel yearModel) {
    return GridView.builder(
        itemBuilder: (context, index) {
          return MonthItem(yearModel.monthList[index]);
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        shrinkWrap: true,
        physics: new NeverScrollableScrollPhysics(),
        itemCount: yearModel.monthList.length);
  }
}
