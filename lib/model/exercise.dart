class Exercise {
  final String id;
  final String exerciseSetId;
  final String name;
  final int reps;
  final String videoUrl;
  final String imageUrl;
  final DateTime createdAt;
  final int point;
  final String type;
  final bool isFavourite;

  Exercise({
    this.type,
    this.createdAt,
    this.point,
    this.id,
    this.name,
    this.reps,
    this.videoUrl,
    this.imageUrl,
    this.isFavourite,
    this.exerciseSetId,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      id: (json['id'].toString()) ?? null,
      exerciseSetId: (json['exerciseSetId'].toString()) ?? null,
      name: json['name'] ?? null,
      reps: json["reps"] ?? null,
      imageUrl: json["imageUrl"] ?? null,
      videoUrl: json["videoUrl"] ?? null,
      type: json["type"] ?? null,
      createdAt: DateTime.parse(json["createdAt"]).toLocal() ?? null,
      point: json["point"] ?? null,
      isFavourite: json["isFavourite"] ?? null,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'exerciseSetId': exerciseSetId,
        'name': name,
        'reps': reps,
        'createdAt': createdAt.toIso8601String(),
        'point': point,
        'imageUrl': imageUrl,
        'videoUrl': videoUrl,
        'type': type,
        'isFavourite': isFavourite,
      };
}
