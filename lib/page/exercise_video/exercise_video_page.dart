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
        appBar: AppBar(
          backgroundColor: Color(0xFF4E1E46),
          title: Text(
            "Exercise Tutorial",
            style: TextStyle(color: Colors.red),
          ),
        ),
        body: YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
          ),
          builder: (context, player) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Text(
                    currentExercise.name,
                    style: Theme.of(context).textTheme.headline4.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                player,
              ],
            );
          },
        ),
      ),
    );
  }
}
