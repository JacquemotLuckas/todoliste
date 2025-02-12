import 'package:uuid/uuid.dart';

class Task {
  String id;
  String content;
  DateTime createdAt;
  DateTime? completedAt;
  TaskStatus status;

  Task({required this.content, this.status = TaskStatus.todo, this.completedAt}) : this.id = Uuid().v4(), this.createdAt = DateTime.now();
  
  @override
  String toString(){
    return "Task (id: $id, content: $content, status: $status, createdAt: $createdAt, completedAt: $completedAt \n";
  }
}

enum TaskStatus{
  todo,
  doing,
  done
}

