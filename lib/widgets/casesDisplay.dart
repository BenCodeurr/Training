import 'package:flutter/material.dart';

class StatusPanel extends StatelessWidget {
  final String cases;
  final Color color;
  final String title;
  const StatusPanel({
    Key key, this.cases, this.color, this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(6),
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            shape:BoxShape.circle,
            color: color.withOpacity(.26)
          ),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:Colors.transparent,
              border: Border.all(
                color: color,
                width: 2,
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          cases,
          style: TextStyle(
            fontSize: 18,
            color: color
          ),
        ),
        Text(
          title,
          style: TextStyle(
            color:Colors.black54
          ),
          ),
      ],
    );
  }
}