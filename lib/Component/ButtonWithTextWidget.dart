import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonWithTextWidget extends StatelessWidget {
  IconData iconData;
  String label;

  ButtonWithTextWidget(this.iconData, this.label);

  @override
  Widget build(BuildContext context) {
    Color color = Color.fromRGBO(131, 167, 181, 1);
    return new Column(
      children: [
        new Container(
          child: new Icon(iconData, color: color),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: Color.fromRGBO(233, 250, 206, 1), borderRadius: BorderRadius.circular(30)),
        ),
        new Container(
          margin: const EdgeInsets.only(top: 12.0, bottom: 32.0),
          child: new Text(
            label,
            textAlign: TextAlign.center,
            style: new TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.spaceAround,
    );
  }
}
