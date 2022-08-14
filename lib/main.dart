import 'package:flutter/material.dart';

void main() => runApp(ToDo());

class ToDo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO!',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void addTask(String task) {
    tasklist.tasklist.add(TaskItem(label: task));
  }

  TaskList tasklist = new TaskList([]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
            title: const Text(
              'TASKS',
              style: TextStyle(
                fontSize: 40.0,
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.w600,
              ),
            ),
            backgroundColor: Color.fromARGB(255, 9, 0, 61)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TaskList(tasklist.tasklist),
            Input((String taskName) {
              setState(() {
                addTask(taskName);
                print(tasklist.tasklist);
              });
            }),
          ],
        ),
      ),
    );
  }
}

class TaskList extends StatefulWidget {
  List<TaskItem> tasklist = [];

  TaskList(List<TaskItem> this.tasklist, {Key? key}) : super(key: key);

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    print("ged");
    return Container(
        padding: const EdgeInsets.all(20),
        child: Column(children: widget.tasklist));
  }
}

class Input extends StatelessWidget {
  final void Function(String) onSubmit;

  Input(this.onSubmit);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: TextField(
          onSubmitted: onSubmit,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Write a task',
          ),
        ),
      ),
    );
  }
}

class TaskItem extends StatefulWidget {
  final String label;

  TaskItem({Key? key, required this.label}) : super(key: key);

  @override
  _TaskItemState createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Color.fromARGB(255, 216, 216, 216),
      ),
      margin: new EdgeInsets.all(15.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 12.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.label,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
