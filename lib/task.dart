import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';

class Task {
  const Task({required this.title, required this.description});
  final String title;
  final String description;

  // Convert a Task to JSON
  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
      };

  // Create a Task from JSON
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      title: json['title'],
      description: json['description'],
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Task &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          description == other.description;

  @override
  int get hashCode => title.hashCode ^ description.hashCode;
}

// Path to the file where tasks are saved
Future<String> _getFilePath() async {
  final directory = await getApplicationDocumentsDirectory();
  return '${directory.path}/tasks.json';
}

// Save tasks to JSON file
Future<void> saveTasks(List<Task> tasks) async {
  final file = File(await _getFilePath());
  final json = jsonEncode(tasks.map((task) => task.toJson()).toList());
  await file.writeAsString(json);
}

// Load tasks from JSON file
Future<List<Task>> loadTasks() async {
  try {
    final file = File(await _getFilePath());
    if (await file.exists()) {
      final json = jsonDecode(await file.readAsString());
      return (json as List).map((task) => Task.fromJson(task)).toList();
    }
  } catch (e) {
    print('Error loading tasks: $e');
  }
  return [];
}

List<Task> savedTasks = [];

// Load saved tasks when app starts
void loadSavedTasks() async {
  savedTasks = await loadTasks();
}

// Save tasks when needed
void addTask(Task task) {
  savedTasks.add(task);
  saveTasks(savedTasks);
}
