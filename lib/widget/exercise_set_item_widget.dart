import 'package:flutter/material.dart';

class ExerciseSetItemWidget extends StatelessWidget {
  final String? imageUrl;

  const ExerciseSetItemWidget({Key? key, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 80,
        width: 80,
        padding: EdgeInsets.all(16 / 2),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 2,
              offset: const Offset(8, 0), // changes position of shadow
            ),
          ],
        ),
        child: Image.asset(
          imageUrl ?? '',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
