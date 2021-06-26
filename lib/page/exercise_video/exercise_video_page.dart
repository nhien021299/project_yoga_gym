import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../model/exercise.dart';
import '../../widget/default_layout.dart';

class ExerciseVideoPage extends StatefulWidget {
  final Exercise exercise;

  const ExerciseVideoPage({
    this.exercise,
  });

  @override
  _ExerciseVideoPageState createState() => _ExerciseVideoPageState();
}

class _ExerciseVideoPageState extends State<ExerciseVideoPage> {
  YoutubePlayerController _controller;
  Exercise currentExercise;

  @override
  void initState() {
    super.initState();
    currentExercise = widget.exercise;
    _controller = YoutubePlayerController(
      initialVideoId: currentExercise.videoUrl,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        loop: true,
        hideThumbnail: false,
        enableCaption: true,
        forceHD: true,
        controlsVisibleAtStart: true,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
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
      body: Scaffold(
        backgroundColor: Colors.transparent,
        body: YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
          ),
          builder: (context, player) {
            return SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () => Get.back(),
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        Text(
                          currentExercise.name,
                          style: Theme.of(context).textTheme.headline5.copyWith(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: player,
                  ),
                  Text(
                    "Description",
                    style: Theme.of(context).textTheme.headline4.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                  ),
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                      children: [
                        Text(
                          "- Reps: ${currentExercise.reps} times",
                          style: Theme.of(context).textTheme.headline5.copyWith(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Text(
                            "- Calories: ${currentExercise.kcal} kcal",
                            style: Theme.of(context).textTheme.headline5.copyWith(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        Text(
                          "- Point: ${currentExercise.point} pts",
                          style: Theme.of(context).textTheme.headline5.copyWith(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
