import 'MonthModel.dart';

class YearModel{
  //日期的“年”
  int yearValue;

  //这年中的所有月的列表
  List<MonthModel> monthList;

  YearModel(this.yearValue,this.monthList);

}