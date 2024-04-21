import 'package:fitness_app_ii_example/controller/search_controller.dart';
import 'package:fitness_app_ii_example/widget/exercises_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widget/default_layout.dart';

/// Trong StateManagement GetX, Thì mỗi 1 Page sẽ có 1 Controller đi kèm.
class SearchExercisePage extends GetView<SearchExerciseController> {
  const SearchExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    SearchExerciseBinding().dependencies();

    return DefaultLayout(
      background: Image.asset(
        'assets/images/home_bg.png',
        height: Get.height,
        width: Get.width,
        fit: BoxFit.fill,
      ),
      body: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            /// NOTE: Day la UI dạng cột
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /// Dùng text field => có thể nhập chữ từ bàn phím.
              /// Controller ở đây là "SearchExerciseController".
              /// "textController" nằm bên trong "SearchExerciseController".

              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: TextField(
                  controller: controller.textController,
                  onChanged: (text) {
                    controller.handleSearch(text);
                  },
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Search Exercise',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.orange,
                        width: 1.4,
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.orange,
                        width: 1.4,
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),

              /// Trong GetX , khi sử dụng 1 biến RX thì phải nam trong Widget OBX => Để render lại UI.
              Obx(
                () => Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SizedBox(
                      child:  ListView.builder(
                          /// Dùng list search để hiện thị all lên UI.
                          itemCount: controller.searchExercises.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () => controller.playVideo(
                                controller.searchExercises[index],
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                child: ExercisesItemWidget(
                                  image: controller
                                      .searchExercises[index].imageUrl,
                                  title:
                                      controller.searchExercises[index].name,
                                  value:
                                      controller.searchExercises[index].reps,
                                  isFavorite: controller
                                      .searchExercises[index].isFavourite,
                                  onTap: () => controller.updateFavorites(
                                    controller.searchExercises[index],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),

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
