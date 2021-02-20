import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/model/WeekProportionModel.dart';
import 'package:to_do_list/value/MyColors.dart';

/// 一条周几的进度的Item
// ignore: must_be_immutable
class WeekProportionItem extends StatelessWidget {
  WeekProportionModel _weekProportion;

  WeekProportionItem(this._weekProportion);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 24),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(_weekProportion.title,
              style: TextStyle(
                fontSize: 28,
                fontFamily: 'orangejuice',
                color: Colors.blueGrey,
                backgroundColor: Colors.transparent,
              )),
          Row(
            children: [
              Expanded(
                  child: Container(
                margin: const EdgeInsets.only(right: 16),
                child: ClipRRect(
                  borderRadius: new BorderRadius.all(const Radius.circular(10.0)),
                  child: LinearProgressIndicator(
                    minHeight: 32,
                    backgroundColor: MyColors.colorPrimary,
                    valueColor: AlwaysStoppedAnimation(MyColors.colorAccent),
                    value: _weekProportion.proportion,
                  ),
                ),
              )),
              Container(
                  margin: const EdgeInsets.only(right: 32),
                  child: Text(
                    (_weekProportion.proportion * 100).ceil().toString() + "%",
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'orangejuice',
                      color: Colors.blueGrey,
                      backgroundColor: Colors.transparent,
                    ),
                  ))
            ],
          )
        ]));
  }
}
