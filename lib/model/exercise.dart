class Exercise {
  final String id;
  final String name;
  final int kcal;
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
    this.kcal,
    this.reps,
    this.videoUrl,
    this.imageUrl,
    this.isFavourite = false,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      id: (json['id'].toString()) ?? null,
      name: json['name'] ?? null,
      kcal: json['kcal'] ?? null,
      reps: json["reps"] ?? null,
      imageUrl: json["imageUrl"] ?? null,
      videoUrl: json["videoUrl"] ?? null,
      type: json["type"] ?? null,
      createdAt: DateTime.parse(json["createdAt"]).toLocal() ?? null,
      point: json["point"] ?? null,
      isFavourite: json["isFavourite"] == null
          ? false
          : json["isFavourite"] == 1
              ? true
              : false,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'reps': reps,
        'kcal': kcal,
        'createdAt': createdAt.toIso8601String(),
        'point': point,
        'imageUrl': imageUrl,
        'videoUrl': videoUrl,
        'type': type,
        'isFavourite': isFavourite ? 1 : 0,
      };
}
