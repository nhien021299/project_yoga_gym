class Exercise {
  final int? id;
  final int? exerciseSetId;
  final String? name;
  final int? kcal;
  final int? reps;
  final String? videoUrl;
  final String? imageUrl;
  final DateTime? createdAt;
  final int? point;
  final String? type;
  final bool? isFavourite;

  Exercise({
    this.type,
    this.createdAt,
    this.point,
    this.id,
    this.name,
    this.kcal,
    this.reps,
    this.videoUrl,
    this.imageUrl,
    this.isFavourite = false,
    this.exerciseSetId,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      id: json['id'],
      exerciseSetId: json['exerciseSetId'],
      name: json['name'],
      kcal: json['kcal'],
      reps: json["reps"],
      imageUrl: json["imageUrl"],
      videoUrl: json["videoUrl"],
      type: json["type"],
      createdAt: DateTime.parse(json["createdAt"]).toLocal(),
      point: json["point"],
      isFavourite: json["isFavourite"] != null
          ? json["isFavourite"] == 1
              ? true
              : false
          : false,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'exerciseSetId': exerciseSetId,
        'name': name,
        'reps': reps,
        'kcal': kcal,
        'createdAt': createdAt?.toIso8601String(),
        'point': point,
        'imageUrl': imageUrl,
        'videoUrl': videoUrl,
        'type': type,
        'isFavourite': isFavourite ?? false ? 1 : 0,
      };
}
