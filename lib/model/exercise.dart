import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';

class Exercise {
  final String name;
  final Duration duration;
  final int noOfReps;
  final String videoUrl;
  final String imageUrl;
  VideoPlayerController controller;

  Exercise({
    this.name,
    this.duration,
    this.noOfReps,
    this.videoUrl,
    this.imageUrl,
  });
}
