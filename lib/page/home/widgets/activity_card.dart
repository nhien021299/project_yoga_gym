import 'package:flutter/material.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({
    Key key,
    @required this.value,
    @required this.unit,
    @required this.chartImage,
    @required this.unitIcon,
  }) : super(key: key);

  final String value;
  final String unit;
  final String chartImage;
  final String unitIcon;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
      child: Container(
        height: 115,
        padding: EdgeInsets.all(16 * 1.5),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    value,
                    style: Theme.of(context).textTheme.headline3.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      height: 1,
                    ),
                  ),
                  Text(
                    unit,
                    style: TextStyle(height: 1),
                  )
                ],
              ),
            ),
            SizedBox(width: 32),
            Expanded(
              flex: 3,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Image.asset(
                      chartImage,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(width: 32),
                  Column(
                    children: [
                      Image.asset(
                        unitIcon,
                        height: 24,
                        width: 24,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}