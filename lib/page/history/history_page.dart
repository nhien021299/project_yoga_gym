import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/default_layout.dart';
import '../../widget/exercises_item_widget.dart';
import 'widgets/day_in_week_card.dart';
import 'widgets/progress_bar.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final now = DateTime.now();
  final _selectedDay = Rx<DateTime>(DateTime.now());

  void onSelectedDay(DateTime dateTime) {
    _selectedDay.value = dateTime;
  }

  bool equalsDate(DateTime a, DateTime b) {
    return a.day == b.day && a.month == b.month && a.year == b.year;
  }

  @override
  Widget build(BuildContext context) {
    List<DateTime> listDateTime = List<DateTime>.generate(
        7, (index) => now.subtract(Duration(days: index)));
    return DefaultLayout(
      background: Image.asset(
        'assets/images/home_bg.png',
        height: Get.height,
        width: Get.width,
        fit: BoxFit.fill,
      ),
      body: SafeArea(
        child: Container(
          width: Get.width,
          height: Get.height,
          padding: EdgeInsets.all(16 * 1.5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Weekly Activity",
                style: Theme.of(context).textTheme.headline5.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(height: 16),
              SizedBox(
                height: 70,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  reverse: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: listDateTime?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Obx(
                      () => GestureDetector(
                        onTap: () => onSelectedDay(listDateTime[index]),
                        child: DayInWeekCard(
                          dateTime: listDateTime[index],
                          isSelected: equalsDate(
                              listDateTime[index], _selectedDay.value),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Weekly Points",
                style: Theme.of(context).textTheme.headline5.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(height: 16),
              ProgressBar(
                currentPoint: 1750,
                maxPoint: 2000,
              ),
              SizedBox(height: 16),
              Expanded(
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    ExercisesItemWidget(
                        image: "assets/images/category_work_out.png",
                        title: "Work Out 1",
                        value: 15),
                    Divider(
                      height: 32,
                    ),
                    ExercisesItemWidget(
                        image: "assets/images/workout2.png",
                        title: "Work Out 2",
                        value: 15),
                    Divider(
                      height: 32,
                    ),
                    ExercisesItemWidget(
                        image: "assets/images/workout3.png",
                        title: "Work Out 3",
                        value: 15),
                    Divider(
                      height: 32,
                    ),
                  ],
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
