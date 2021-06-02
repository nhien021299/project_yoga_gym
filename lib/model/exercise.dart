import 'package:video_player/video_player.dart';

class Exercise {
  final String id;
  final String name;
  final Duration duration;
  final int noOfReps;
  final String videoUrl;
  final String imageUrl;
  VideoPlayerController controller;

  Exercise({
    this.id,
    this.name,
    this.duration,
    this.noOfReps,
    this.videoUrl,
    this.imageUrl,
  });
  factory Exercise.fromJson(Map<String, dynamic> json) {
    // final raws = json['product'];
    // Product orderProducts = ;

    // if (raws != null && raws is List && raws.isNotEmpty) {
    //   orderProducts = [];
    //   raws.forEach((rawI) {
    //     final orderProduct = Product.fromJson(rawI);
    //     orderProducts.add(orderProduct);
    //   });
    // }
    return Exercise(
      id: (json['id']) ?? null,
      name: json['name'] ?? null,
      duration: (json['duration']) ?? null,
      noOfReps: json["noOfReps"] ?? null,
    );
  }

  Map<String, dynamic> toMapForDb() {
    var map = Map<String, dynamic>();
    map['id'] = id;
    map['name'] = name;
    map['duration'] = duration;
    map['noOfReps'] = noOfReps;
    return map;
  }
}
