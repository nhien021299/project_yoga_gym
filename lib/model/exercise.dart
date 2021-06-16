class Exercise {
  final String id;
  final String name;
  final Duration duration;
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
    this.duration,
    this.reps,
    this.videoUrl,
    this.imageUrl,
    this.isFavourite = false,
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
      id: (json['id'].toString()) ?? null,
      name: json['name'] ?? null,
      // duration: (json['duration']) ?? null,
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
        'createdAt': createdAt.toIso8601String(),
        'point': point,
        'imageUrl': imageUrl,
        'videoUrl': videoUrl,
        'type': type,
        'isFavourite': isFavourite ? 1 : 0,
      };
}
