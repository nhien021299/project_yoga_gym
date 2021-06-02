import 'package:flutter/material.dart';

import '../../model/exercise_set.dart';
import '../exercise_detail/exercise_video_page.dart';

class ExercisesPage extends StatelessWidget {
  final ExerciseSet exerciseSet;

  const ExercisesPage({Key key, this.exerciseSet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(exerciseSet.name),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Expanded(
          child: ListView.builder(
              itemCount: exerciseSet.exercises.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ExerciseVideoPage(
                      exerciseSet: exerciseSet,
                      selectedExercise: exerciseSet.exercises[index],
                    ),
                  )),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha(20),
                            offset: Offset(2, 5),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Image(
                            width: 50,
                            height: 50,
                            image: AssetImage(
                              exerciseSet.exercises[index].imageUrl,
                            ),
                          ),
                          SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Name : ' +
                                  exerciseSet.exercises[index].name),
                              Text('Duration : ' +
                                  exerciseSet
                                      .exercises[index].duration.inSeconds
                                      .toString() +
                                  ' seconds'),
                              Text('Reps : ' +
                                  exerciseSet.exercises[index].noOfReps
                                      .toString() +
                                  ' times'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
