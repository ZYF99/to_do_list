import 'package:to_do_list/model/DayRecordModel.dart';

class MonthModel{

  //日期的“月”
  int monthValue;

  //这月中的所有天的列表
  List<DayRecordModel>dayRecordList;

  MonthModel(this.monthValue,this.dayRecordList);

}