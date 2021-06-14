import 'package:flutter/material.dart';

import '../../model/exercise.dart';
import 'widgets/video_controls_widget.dart';
import 'widgets/video_player_widget.dart';

class ExerciseVideoPage extends StatefulWidget {
  final Exercise selectedExercise;

  const ExerciseVideoPage({
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
          title: Text(
            currentExercise.name,
            style: TextStyle(color: Colors.red),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: Stack(
          children: [
            buildVideos(),
          ],
        ),
      );

  Widget buildVideos() => VideoPlayerWidget(
        exercise: widget.selectedExercise,
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
