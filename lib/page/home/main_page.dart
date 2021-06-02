import 'package:flutter/material.dart';

import '../../widget/tab_item_widget.dart';
import '../custom_exercises/custom_exercises_page.dart';
import '../exercises/all_exercises_page.dart';
import '../favourite/favourite_page.dart';
import '../history/history_page.dart';
import 'home_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      initialIndex: 2,
      child: Scaffold(
        body: TabBarView(
          children: [
            FavouritePage(),
            HistoryPage(),
            HomePage(),
            AllExercisePage(),
            CustomExercisesPage(),
          ],
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(top: 12, bottom: 6),
          decoration: const BoxDecoration(
            color: Color(0xFF4E1E46),
          ),
          child: TabBar(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.redAccent,
            tabs: [
              TabItemWidget(
                icon: Icons.favorite,
              ),
              TabItemWidget(
                icon: Icons.history,
              ),
              TabItemWidget(
                icon: Icons.home,
              ),
              TabItemWidget(
                icon: Icons.menu,
              ),
              TabItemWidget(
                icon: Icons.settings_rounded,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
