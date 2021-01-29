import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///D:/AndroidStudioProjects/to_do_list/lib/page/home/RecordItem.dart';
import 'package:to_do_list/model/RecordModel.dart';
import 'package:to_do_list/value/MyColors.dart';

///首页
class DailyListPage extends StatelessWidget {
  List<RecordModel> _recordList;

  @override
  Widget build(BuildContext context) {
    getRecordList();
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            buildTitle(),
            Expanded(
                child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return RecordCard(_recordList[index]);
              },
              itemCount: _recordList.length,
            )),
            Container(
              height: 120,
            )
          ],
        ));
  }

  //获取记录列表
  getRecordList() {
    _recordList = [
      RecordModel("哈哈哈哈哈哈", DateTime.now().millisecondsSinceEpoch, true),
      RecordModel("阿三发射点发定位算法受到广泛的是法国十大过而无人管", DateTime.now().millisecondsSinceEpoch, false),
      RecordModel("太诱人据研究人员统计和一统江湖", DateTime.now().millisecondsSinceEpoch, true),
      RecordModel("一天就图jet热缩管和让我给", DateTime.now().millisecondsSinceEpoch, false),
      RecordModel("一天就图jet热缩管和让我给", DateTime.now().millisecondsSinceEpoch, true),
      RecordModel("一天就图jet热缩管和让我给", DateTime.now().millisecondsSinceEpoch, false),
      RecordModel("一天就图jet热缩管和让我给", DateTime.now().millisecondsSinceEpoch, true),
      RecordModel("一天就图jet热缩管和让我给", DateTime.now().millisecondsSinceEpoch, true),
      RecordModel("一天就图jet热缩管和让我给", DateTime.now().millisecondsSinceEpoch, false),
      RecordModel("一天就图jet热缩管和让我给", DateTime.now().millisecondsSinceEpoch, true),
      RecordModel("一天就图jet热缩管和让我给", DateTime.now().millisecondsSinceEpoch, true),
      RecordModel("一天就图jet热缩管和让我给", DateTime.now().millisecondsSinceEpoch, false),
      RecordModel("一天就图jet热缩管和让我给", DateTime.now().millisecondsSinceEpoch, true),
      RecordModel("一天就图jet热缩管和让我给", DateTime.now().millisecondsSinceEpoch, false),
      RecordModel("一天就图jet热缩管和让我给", DateTime.now().millisecondsSinceEpoch, true),
      RecordModel("一天就图jet热缩管和让我给", DateTime.now().millisecondsSinceEpoch, false),
      RecordModel("一天就图jet热缩管和让我给", DateTime.now().millisecondsSinceEpoch, true),
      RecordModel("一天就图jet热缩管和让我给", DateTime.now().millisecondsSinceEpoch, true),
      RecordModel("一天就图jet热缩管和让我给", DateTime.now().millisecondsSinceEpoch, false),
      RecordModel("一天就图jet热缩管和让我给", DateTime.now().millisecondsSinceEpoch, true),
    ];
    _recordList.sort((left, right) => left.time.compareTo(right.time));
  }

  //Title
  Widget buildTitle() {
    return Container(
        decoration:
            BoxDecoration(color: MyColors.colorPrimary, borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.only(top: 64),
        padding: const EdgeInsets.fromLTRB(78, 4, 78, 4),
        child: Text(
          "Daily list",
          style: TextStyle(
            fontSize: 56,
            fontFamily: 'orangejuice',
            color: Colors.blueGrey,
            backgroundColor: Colors.transparent,
          ),
          textAlign: TextAlign.center,
        ));
  }
}
