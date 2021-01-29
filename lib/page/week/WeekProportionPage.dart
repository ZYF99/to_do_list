import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/model/WeekProportionModel.dart';
import 'package:to_do_list/page/week/WeekProportionItem.dart';
import 'package:to_do_list/widget/SquareScaffold.dart';

class WeekProportionPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WeekProportionState();
  }
}

class WeekProportionState extends State<WeekProportionPage> {
  List<WeekProportionModel> _weekProportionList;

  @override
  Widget build(BuildContext context) {
    getProportionList();
    return SquareScaffoldUtil.buildSquareScaffold(
      Container(
        margin: const EdgeInsets.only(top: 64, left: 32),
        child: Column(
          children: [
            buildTitle(),
            Expanded(
                child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return WeekProportionItem(_weekProportionList[index]);
              },
              itemCount: _weekProportionList.length,
            ))
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
    );
  }

  //获取进度列表
  getProportionList() {
    _weekProportionList = [
      WeekProportionModel("Mon", 0.1),
      WeekProportionModel("Tue", 0.3),
      WeekProportionModel("Thur", 0.6),
      WeekProportionModel("Wed", 0.2),
      WeekProportionModel("Fri", 0.5),
      WeekProportionModel("Sat", 0.8),
      WeekProportionModel("Sun", 0.9),
    ];
  }

  //构建Title
  Widget buildTitle() {
    return Text(
      "Week",
      style: TextStyle(
        fontSize: 88,
        fontFamily: 'orangejuice',
        color: Colors.blueGrey,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
