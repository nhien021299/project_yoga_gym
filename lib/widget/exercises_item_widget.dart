import 'package:flutter/material.dart';

class ExercisesItemWidget extends StatelessWidget {
  const ExercisesItemWidget({
    Key key,
    @required this.image,
    @required this.title,
    @required this.value,
    this.unit,
  }) : super(key: key);

  final String image, title, unit, value;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            height: 80,
            width: 80,
            padding: EdgeInsets.all(16 / 2),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.asset(image),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Text(
                            title,
                            style: Theme.of(context).textTheme.headline4.copyWith(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                  height: 1,
                                ),
                          ),
                          SizedBox(width: 16 / 2),
                          Text(
                            unit ?? "",
                          ),
                        ],
                      ),
                      SizedBox(height: 16 / 2),
                      Text(
                        value,
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              height: 1,
                            ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.star_rounded),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
