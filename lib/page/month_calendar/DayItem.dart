import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/model/DayRecordModel.dart';

class DayItem extends StatelessWidget {
  DayRecordModel _dayRecordModel;

  DayItem(this._dayRecordModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
        child: Stack(
      children: [
        CircularProgressIndicator(
          strokeWidth: 1.0,
          backgroundColor: Colors.white,
          value: _dayRecordModel.dayProportion,
          valueColor: new AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 203, 184, 218)),
        ),
        Center(child: Text(
          _dayRecordModel.dayValue.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 10),
        ))
      ],
      fit: StackFit.passthrough,
    ));
  }
}
