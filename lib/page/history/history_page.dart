import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/history_controller.dart';
import '../../widget/default_layout.dart';
import '../../widget/exercises_item_widget.dart';
import '../exercise_video/exercise_video_page.dart';
import 'widgets/day_in_week_card.dart';
import 'widgets/progress_bar.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  HistoryController historyController = Get.put(HistoryController());

  @override
  void initState() {
    setState(() {
      historyController.loadData();
    });
    super.initState();
  }

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
            /// NOTE: Day la UI dạng cột
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Weekly Activity",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(height: 16),
              SizedBox(
                height: 80,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  reverse: true,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: historyController.listDateTime.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Obx(
                      () => GestureDetector(
                        onTap: () => historyController.onSelectedDay(
                            historyController.listDateTime[index]),
                        child: DayInWeekCard(
                          dateTime: historyController.listDateTime[index],
                          isSelected: historyController.equalsDate(
                              historyController.listDateTime[index],
                              historyController.selectedDay.value),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Weekly Points",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(height: 16),
              Obx(
                () => ProgressBar(
                  currentPoint: historyController.totalPoint.value,
                  maxPoint: 2000,
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    child: GetX<HistoryController>(
                      builder: (controller) {
                        return ListView.builder(
                          itemCount: controller.filteredHistories.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () => Get.to(ExerciseVideoPage(
                                exercise: controller.filteredHistories[index],
                              )),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                child: ExercisesItemWidget(
                                  image: controller
                                      .filteredHistories[index].imageUrl,
                                  title:
                                      controller.filteredHistories[index].name,
                                  value:
                                      controller.filteredHistories[index].reps,
                                  isFavorite: controller
                                      .filteredHistories[index].isFavourite,
                                  showFavourite: true,
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
