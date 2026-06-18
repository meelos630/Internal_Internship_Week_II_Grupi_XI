import 'package:flutter/material.dart';

void main() {
  runApp(const TaskTrackerApp());
}

class TaskTrackerApp extends StatelessWidget {
  const TaskTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Day 3 Task Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: false,
      ),
      home: const TaskTrackerScreen(),
    );
  }
}

class TaskItem {
  String title;
  bool isDone;

  TaskItem({
    required this.title,
    required this.isDone,
  });
}

class TaskTrackerScreen extends StatefulWidget {
  const TaskTrackerScreen({super.key});

  @override
  State<TaskTrackerScreen> createState() => _TaskTrackerScreenState();
}

class _TaskTrackerScreenState extends State<TaskTrackerScreen> {
  final TextEditingController taskController = TextEditingController();

  final List<TaskItem> tasks = [
    TaskItem(title: 'Finish Flutter task', isDone: false),
    TaskItem(title: 'Commit project to GitHub', isDone: true),
  ];

  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void addTask() {
    final text = taskController.text.trim();

    if (text.isEmpty) {
      showMessage('Please write a task first');
      return;
    }

    setState(() {
      tasks.add(TaskItem(title: text, isDone: false));
      taskController.clear();
    });

    Navigator.pop(context);
    showMessage('Task added');
  }

  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });

    showMessage('Task deleted');
  }

  void toggleTaskStatus(int index) {
    setState(() {
      tasks[index].isDone = !tasks[index].isDone;
    });

    showMessage('Task status updated');
  }

  void openAddTaskDialog() {
    taskController.clear();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add New Task'),
          content: TextField(
            controller: taskController,
            decoration: const InputDecoration(
              labelText: 'Task title',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: addTask,
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final int totalTasks = tasks.length;
    final int doneTasks = tasks.where((task) => task.isDone).length;
    final int activeTasks = totalTasks - doneTasks;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Tracker'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openAddTaskDialog,
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 700),
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Total: $totalTasks'),
                      Text('Done: $doneTasks'),
                      Text('Active: $activeTasks'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: tasks.isEmpty
                    ? const Center(
                        child: Text('No tasks added yet'),
                      )
                    : ListView.builder(
                        itemCount: tasks.length,
                        itemBuilder: (context, index) {
                          final task = tasks[index];

                          return Card(
                            child: ListTile(
                              leading: Checkbox(
                                value: task.isDone,
                                onChanged: (value) {
                                  toggleTaskStatus(index);
                                },
                              ),
                              title: Text(
                                task.title,
                                style: TextStyle(
                                  decoration: task.isDone
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none,
                                ),
                              ),
                              subtitle: Text(
                                task.isDone ? 'Done' : 'Active',
                              ),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  deleteTask(index);
                                },
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
