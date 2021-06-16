import 'package:fitness_app_ii_example/controller/history_controller.dart';
import 'package:fitness_app_ii_example/page/exercise_video/exercise_video_page.dart';
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
  HistoryController historyController = Get.find();

  @override
  Widget build(BuildContext context) {
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
                style: Theme.of(context).textTheme.headline4.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(height: 16),
              SizedBox(
                height: 70,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  reverse: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: historyController.listDateTime?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Obx(
                      () => GestureDetector(
                        onTap: () => historyController.onSelectedDay(historyController.listDateTime[index]),
                        child: DayInWeekCard(
                          dateTime: historyController.listDateTime[index],
                          isSelected: historyController.equalsDate(historyController.listDateTime[index], historyController.selectedDay.value),
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
                currentPoint: historyController.getTotalPoint(),
                maxPoint: 2000,
              ),
              SizedBox(height: 16),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    child: GetX<HistoryController>(
                      init: HistoryController(),
                      builder: (controller) {
                        return ListView.builder(
                          itemCount: controller.filteredHistories.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () => Get.to(ExerciseVideoPage(
                                exercise: controller.filteredHistories[index],
                              )),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                child: ExercisesItemWidget(
                                  image: controller.filteredHistories[index].imageUrl,
                                  title: controller.filteredHistories[index].name,
                                  value: controller.filteredHistories[index].reps,
                                  isFavorite: controller.filteredHistories[index].isFavourite,
                                  isHistory: true,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
