import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DayInWeekCard extends StatelessWidget {
  const DayInWeekCard({
    Key? key,
    required this.dateTime,
    required this.isSelected,
  }) : super(key: key);

  final DateTime dateTime;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    String formatDateTime(DateTime dateTime, {String pattern = "dd/MM/yyyy"}) {
      final dateFormatter = DateFormat(pattern);
      return dateFormatter.format(dateTime);
    }

    return Card(
      color: isSelected ? Theme.of(context).primaryColor : Colors.transparent,
      shadowColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(16 / 2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              formatDateTime(dateTime, pattern: "EEE"),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isSelected
                      ? Colors.white
                      : Theme.of(context).textTheme.bodyLarge?.color),
            ),
            Text(
              dateTime.day.toString(),
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: isSelected
                        ? Colors.white
                        : Theme.of(context).textTheme.bodyLarge?.color,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
