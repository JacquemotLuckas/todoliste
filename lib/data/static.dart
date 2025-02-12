import 'package:todolist/models/task.dart';
import 'package:faker/faker.dart';
import 'dart:math';

final List<Task> tasksCollectionOld = [
  Task(content: "Souhaiter l'Anniversaire de Maël", status: TaskStatus.done),
  Task(content: "Rendez-vous robinet", status: TaskStatus.todo),
  Task(content: "Refaire le monde", status: TaskStatus.doing)
];

final List<Task> tasksCollection = List.generate(20, (index) {
  TaskStatus status = TaskStatus.values[Random().nextInt(TaskStatus.values.length)];
  if(status == TaskStatus.done){
    return Task(content: faker.lorem.sentence(), status: status, completedAt: generateRandomDateTime());
  }else{
    return Task(content: faker.lorem.sentence(), status: status);
  }
});

DateTime generateRandomDateTime() {
  Random random = Random();
  int day = random.nextInt(31) + 1; 
  int month = random.nextInt(12) + 1;
  int year = random.nextInt(6) + 2020; 
  int hour = random.nextInt(24);
  int minute = random.nextInt(60); 
  return DateTime(year, month, day, hour, minute);
}