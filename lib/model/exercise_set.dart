// import 'package:flutter/material.dart';
//
// import 'exercise.dart';
//
// enum ExerciseType { low, mid, hard, all }
//
// String getExerciseName(ExerciseType type) {
//   switch (type) {
//     case ExerciseType.hard:
//       return 'Hard';
//       break;
//     case ExerciseType.mid:
//       return 'Medium';
//       break;
//     case ExerciseType.low:
//       return 'Easy';
//       break;
//     default:
//       return 'All';
//       break;
//   }
// }
//
// ExerciseType convertExerciseType(String value) {
//   switch (value) {
//     case 'Hard':
//       return ExerciseType.hard;
//       break;
//     case 'Medium':
//       return ExerciseType.mid;
//       break;
//     case 'Easy':
//       return ExerciseType.low;
//       break;
//     default:
//       return ExerciseType.all;
//       break;
//   }
// }
//
// class ExerciseSet {
//   final String id;
//   final String name;
//   final List<Exercise> exercises;
//   final String imageUrl;
//   final ExerciseType exerciseType;
//   final Color color;
//   final int totalPoint;
//
//   const ExerciseSet({
//     this.totalPoint,
//     this.id,
//     this.name,
//     this.exercises,
//     this.imageUrl,
//     this.exerciseType,
//     this.color,
//   });
//
//   String get totalDuration {
//     final duration = exercises.fold(
//       Duration.zero,
//       (previous, element) => previous + element.duration,
//     );
//
//     return duration.inMinutes.toString();
//   }
//
//   factory ExerciseSet.fromJson(Map<String, dynamic> json) {
//     // final raws = json['product'];
//     // Product orderProducts = ;
//
//     // if (raws != null && raws is List && raws.isNotEmpty) {
//     //   orderProducts = [];
//     //   raws.forEach((rawI) {
//     //     final orderProduct = Product.fromJson(rawI);
//     //     orderProducts.add(orderProduct);
//     //   });
//     // }
//     return ExerciseSet(
//       id: (json['id'].toString()) ?? null,
//       name: json['name'] ?? null,
//       exercises: List<Exercise>.from(
//               json["exercises"].map((x) => Exercise.fromJson(x))) ??
//           null,
//       exerciseType: convertExerciseType(json["exerciseType"]) ?? null,
//       totalPoint: json["totalPoint"] ?? null,
//     );
//   }
//
//   Map<String, dynamic> toMapForDb() {
//     var map = Map<String, dynamic>();
//
//     // map['id'] = id;
//     map['name'] = name;
//     // map['duration'] = duration;
//     map['exercises'] = exercises;
//     map['exerciseType'] = getExerciseName(exerciseType);
//     map['totalPoint'] = totalPoint;
//     return map;
//   }
// }
