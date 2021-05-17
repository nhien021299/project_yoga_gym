import 'package:flutter/material.dart';

class TabItemWidget extends StatelessWidget {
  final String name;
  final IconData icon;

  const TabItemWidget({this.icon, this.name});

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.red,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              name ?? "",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
