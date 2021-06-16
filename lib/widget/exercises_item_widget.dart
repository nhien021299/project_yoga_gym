import 'package:flutter/material.dart';

class ExercisesItemWidget extends StatelessWidget {
  const ExercisesItemWidget({
    Key key,
    @required this.image,
    @required this.title,
    @required this.value,
    this.unit,
    this.onTap,
    this.isFavorite = false,
    this.isHistory = false,
  }) : super(key: key);

  final String image, title, unit;
  final int value;
  final Function onTap;
  final bool isFavorite, isHistory;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            height: MediaQuery.of(context).size.width / 4,
            width: MediaQuery.of(context).size.width / 4,
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
                  flex: 9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.headline6.copyWith(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              height: 1,
                            ),
                      ),
                      SizedBox(height: 16 / 2),
                      Text(
                        "${value.toString()} times",
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              height: 1,
                            ),
                      ),
                    ],
                  ),
                ),
                if (!isHistory)
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: onTap ?? null,
                      child: Icon(
                        Icons.star_rounded,
                        color: isFavorite ? Theme.of(context).primaryColor : Colors.black,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
