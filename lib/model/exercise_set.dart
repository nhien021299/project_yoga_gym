import 'exercise.dart';

class ExerciseSet {
  final int id;
  final String name;
  final List<Exercise> exercises;

  const ExerciseSet({
    this.id,
    this.name,
    this.exercises,
  });

  factory ExerciseSet.fromJson(Map<String, dynamic> json) {
    return ExerciseSet(
      id: json['id'] ?? null,
      name: json['name'] ?? null,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
      };
}
