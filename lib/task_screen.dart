import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:daily_manager/task.dart';
import 'package:daily_manager/saved_screen.dart';

final Logger logger = Logger();
List<Task> validTasks = [];

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() {
    return _TaskScreenState();
  }
}

class _TaskScreenState extends State<TaskScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color.fromARGB(255, 0, 0, 0), Colors.blueGrey],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('Add Title'),
          backgroundColor: Colors.blueGrey,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
                  AppBar(automaticallyImplyLeading: false,
                title: const Text('Add Description'),
                backgroundColor: const Color.fromARGB(0, 255, 255, 255),
                foregroundColor: Colors.white,
                elevation: 0,
              ),  
              const SizedBox(height: 8),
              TextField(
                controller: _descriptionController,
                maxLines: null,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  String title = _titleController.text.trim();
                  String description = _descriptionController.text.trim();

                  if (title.isEmpty || description.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content:
                            Text('Please enter both title and description!'),
                      ),
                    );
                    return;
                  }
                  validTasks.add(
                    Task(title: title, description: description),
                  );

                  logger.i('Title: $title');
                  logger.i('Description: $description');

                  _titleController.clear();
                  _descriptionController.clear();

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SavedTasks( ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  backgroundColor: Colors.blueGrey,
                  foregroundColor: Colors.white,
                ),
                label: const Text(
                  'Save Task',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center ,
                ),
                icon: const Icon(Icons.download),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
