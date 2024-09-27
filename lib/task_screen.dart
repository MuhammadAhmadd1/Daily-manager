import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:daily_manager/task.dart';
import 'package:daily_manager/saved_screen.dart';

final Logger logger = Logger();
List<Task> validTasks = [];

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key,this.task});
  final Task? task;
  @override
  State<TaskScreen> createState() {
    return _TaskScreenState();
  }
}

class _TaskScreenState extends State<TaskScreen> {
  final TextEditingController _titleController = TextEditingController(); //A controller for an editable text field.
  final TextEditingController _descriptionController = TextEditingController(); //A controller for an editable text field.
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
          title: const Text(''),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, //to keep save button on left
            children: [
              AppBar(
                automaticallyImplyLeading: false, //remove navigator from title
                title: const Text('Title'),
                backgroundColor: const Color.fromARGB(0, 255, 255, 255),
                foregroundColor: Colors.white,
                elevation: 0,
              ),
              TextField(
                controller: _titleController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.transparent,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none, //remove border
                    borderRadius: BorderRadius.circular(17), 
                  ),
                  hintText: 'Tap to add title',
                  hintStyle: const TextStyle(
                    color: Colors.blueGrey,
                  ),
                ),
                cursorColor: Colors.white,
              ),
              const SizedBox(height: 16),
              AppBar(
                automaticallyImplyLeading: false, //remove navigator from description
                title: const Text('Description'),
                backgroundColor: const Color.fromARGB(0, 255, 255, 255),
                foregroundColor: Colors.white,
                elevation: 0,
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _descriptionController,
                style: const TextStyle(color: Colors.white),
                maxLines: null,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.transparent,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(17),
                  ),
                  hintText: 'Tap to add Description',
                  hintStyle: const TextStyle(
                    color: Colors.blueGrey,
                  ),
                ),
                cursorColor: Colors.white,
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  String title = _titleController.text.trim(); //If the string contains leading or trailing whitespace, a new string with no leading and no trailing whitespace is returned
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
                      builder: (context) => const SavedTasks(),
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
                  textAlign: TextAlign.center,
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
