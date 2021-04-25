import 'package:fitness_app_ii_example/model/exercise.dart';
import 'package:fitness_app_ii_example/model/exercise_set.dart';
import 'package:fitness_app_ii_example/widget/video_controls_widget.dart';
import 'package:fitness_app_ii_example/widget/video_player_widget.dart';
import 'package:flutter/material.dart';

class ExercisePage extends StatefulWidget {
  final ExerciseSet exerciseSet;
  final Exercise selectedExercise;

  const ExercisePage({
    @required this.exerciseSet,
    this.selectedExercise,
  });

  @override
  _ExercisePageState createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  final controller = PageController();
  Exercise currentExercise;

  @override
  void initState() {
    super.initState();

    currentExercise = widget.selectedExercise;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(currentExercise.name),
          centerTitle: true,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            buildVideos(),
            Positioned(
              bottom: 20,
              right: 50,
              left: 50,
              child: buildVideoControls(),
            )
          ],
        ),
      );

  Widget buildVideos() => VideoPlayerWidget(
        exercise: widget.selectedExercise,
        onInitialized: () => setState(() {}),
      );

  Widget buildVideoControls() => VideoControlsWidget(
        exercise: currentExercise,
        onTogglePlaying: (isPlaying) {
          setState(() {
            if (isPlaying) {
              currentExercise.controller.play();
            } else {
              currentExercise.controller.pause();
            }
          });
        },
        onNextVideo: () => controller.nextPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
        ),
        onRewindVideo: () => controller.previousPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
        ),
      );
}
