import 'package:flutter/material.dart';

import '../../model/exercise.dart';
import '../../model/exercise_set.dart';
import 'widgets/video_controls_widget.dart';
import 'widgets/video_player_widget.dart';

class ExerciseVideoPage extends StatefulWidget {
  final ExerciseSet exerciseSet;
  final Exercise selectedExercise;

  const ExerciseVideoPage({
    @required this.exerciseSet,
    this.selectedExercise,
  });

  @override
  _ExerciseVideoPageState createState() => _ExerciseVideoPageState();
}

class _ExerciseVideoPageState extends State<ExerciseVideoPage> {
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
