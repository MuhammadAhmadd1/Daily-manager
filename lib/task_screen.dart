import 'package:flutter/material.dart';
import 'package:logger/web.dart';
import 'package:daily_manager/task.dart';
import 'package:daily_manager/saved_screen.dart';
import 'package:google_fonts/google_fonts.dart';

final Logger logger = Logger();

class StartScreen extends StatelessWidget {
  const StartScreen(this.addTask,{super.key});
  final void Function() addTask;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/task_manager.png',         
            width: 200,
            color: const Color.fromARGB(115, 255, 255, 255),
          ),
          const SizedBox(height: 5),
          Text(
            'Welcome to Daily Manager :)      ',
            style: GoogleFonts.lato(color: Colors.white, fontSize: 20),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: addTask,
            style: OutlinedButton.styleFrom(  
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              backgroundColor: const Color.fromARGB(255, 94, 139, 163),
              foregroundColor: const Color.fromARGB(255, 255, 255, 255),
            ),
            child: Text('Add Task',
                style: GoogleFonts.lato(fontSize: 20),
                textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}


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
          backgroundColor: const Color.fromARGB(0, 255, 255, 255),
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
              AppBar(
                title: const Text('Add Description'),
                backgroundColor: const Color.fromARGB(0, 255, 255, 255),
                foregroundColor: Colors.white,
                elevation: 0,
              ),
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
              ElevatedButton(
                onPressed: () {
                  String title = _titleController.text;
                  String description = _descriptionController.text;
                  savedTasks.add(
                    Task(title: title, description: description),
                  );

                  logger.i('Title: $title');
                  logger.i('Description: $description');

                  _titleController.clear();
                  _descriptionController.clear();

                 Navigator.push(context, 
                 MaterialPageRoute(builder: (context) => const SavedTasks()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Save Task'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
