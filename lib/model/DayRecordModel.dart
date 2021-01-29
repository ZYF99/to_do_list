import 'package:to_do_list/model/RecordModel.dart';

class DayRecordModel {

  //日期的“年”
  int yearValue;

  //日期的“月”
  int monthValue;

  //日期的“日”
  int dayValue;

  //TODO列表
  List<RecordModel> recordList;

  //这一天的完成率
  double get dayProportion =>
      (recordList.where((element) => element.isDone)).length / recordList.length;

  DayRecordModel(this.yearValue,this.monthValue,this.dayValue,this.recordList);
}
