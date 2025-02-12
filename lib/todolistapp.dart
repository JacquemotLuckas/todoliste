import 'package:flutter/material.dart';
import 'data/static.dart';
import 'models/task.dart';


final Color todolistThemeMainColor = Color(0x003ABCA7);

class TodolistApp extends StatefulWidget {
  const TodolistApp({super.key});
  
  @override
  State<TodolistApp> createState() => _TodolistApp();
}

class _TodolistApp extends State<TodolistApp> {
  final ThemeData todolistTheme = ThemeData(primaryColor: todolistThemeMainColor);
  List<Task> _tasks = [];

  @override
  void initState() {
    super.initState();
    // Initialisation des variables d'état ici
    _tasks = tasksCollection;
  }

  AppBar buildAppBar(BuildContext context){
      return AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Todolist", 
              style: TextStyle(
                color: Colors.black87, 
                fontWeight: FontWeight.bold,
                fontSize: 30
              ),
            ),
            Text(
              "${_tasks.length} Tasks",
              style: TextStyle( 
                fontWeight: FontWeight.normal,
                fontSize: 10
              ),
            )
          ],
        ),
        leading: Image.asset("images/todolist.png"),
      );
    }

  @override
  Widget build(BuildContext context) {
    print(tasksCollection);
    return MaterialApp(
      home: Scaffold(
        appBar: buildAppBar(context),
        body: Center(
          child: Column(children: [
            Expanded(child:
              ListView.builder(
                itemCount: _tasks.length,
                itemBuilder: (context, index){
                  Task currentTask = _tasks[index];
                  return ListTile(
                    title: Text(currentTask.content),
                    trailing: buildIcon(currentTask.status),
                    leading: Checkbox(
                      value: currentTask.completedAt != null, 
                      onChanged: (bool? value) { 
                        setState(() {
                          currentTask.completedAt = DateTime.now();
                          currentTask.status = TaskStatus.done;
                        });
                      },
                    )
                  );
                }
              )
            ),
          ],),
        ),
      ),
      theme: todolistTheme,
    );
  }

  Icon buildIcon(TaskStatus status){
    late Icon icone;
    switch(status){
      case TaskStatus.todo:
        icone = Icon(Icons.warning_rounded ,color: Colors.yellow);
        break;
      case TaskStatus.doing:
        icone = Icon(Icons.access_time_filled ,color: Colors.orange);
        break;
      case TaskStatus.done:
        icone = Icon(Icons.check_circle ,color: Colors.green);
        break;
    }
    return icone;
  }
}