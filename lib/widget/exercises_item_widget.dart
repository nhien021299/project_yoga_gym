import 'package:flutter/material.dart';

class ExercisesItemWidget extends StatelessWidget {
  const ExercisesItemWidget({
    Key? key,
    this.image,
    this.title,
    this.value,
    this.unit,
    this.onTap,
    this.isFavorite = false,
    this.showFavourite = false,
    this.isSelected = false,
  }) : super(key: key);

  final String? image, title, unit;
  final int? value;
  final Function()? onTap;
  final bool? isFavorite, showFavourite, isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: isSelected ?? false ? Colors.blue : Colors.transparent,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: MediaQuery.of(context).size.width / 4,
              width: MediaQuery.of(context).size.width / 4,
              padding: EdgeInsets.all(16 / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.asset(
                image ?? '',
                fit: BoxFit.cover,
              ),
            ),
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
                        title ?? '',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              height: 1,
                            ),
                      ),
                      SizedBox(height: 16 / 2),
                      Text(
                        "${value.toString()} times",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              height: 1,
                            ),
                      ),
                    ],
                  ),
                ),
                if (!(showFavourite ?? false))
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        onTap?.call();
                      },
                      child: Icon(
                        Icons.star_rounded,
                        color: isFavorite ?? false
                            ? Theme.of(context).primaryColor
                            : Colors.black,
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
