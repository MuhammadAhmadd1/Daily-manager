import 'package:flutter/material.dart';
import 'package:daily_manager/task_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class SavedTasks extends StatefulWidget {
  const SavedTasks({super.key});
  @override
  State<SavedTasks> createState() {
    return _SavedTasksState();
  }
}

class _SavedTasksState extends State<SavedTasks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Tasks'),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),
      body: Container(
        width: double.infinity, //gradient covers the whole screen
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 0, 0, 0),
              Colors.blueGrey,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: validTasks.isEmpty
            ? const Center(
                child: Text(
                  'No tasks available!',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              )
            : ListView.builder(
                itemCount: validTasks.length,
                itemBuilder: (context, index) {
                  final task = validTasks[index];
                  return ListTile(
                    title: Text(
                      '${index + 1}. ${task.title}',
                      style: GoogleFonts.lato(
                        fontSize: 30,
                        textStyle: const TextStyle(color: Colors.white),
                      ),
                    ),
                    subtitle: Text(
                      task.description,
                      style: GoogleFonts.lato(
                        fontSize: 20,
                        textStyle: const TextStyle(color: Colors.white),
                      ),
                    ),
                    trailing: PopupMenuButton<String>(
                      icon: Icon(Icons.more_vert),
                      onSelected: (String value) {
                        switch (value) {
                          case 'delete':
                            _deleteTask(index);
                            break;
                        }
                      },
                      itemBuilder: (BuildContext context) {
                        return [
                          PopupMenuItem<String>(
                            value: 'delete',
                            child: Text('Delete'),
                          ),
                        ];
                      },
                    ),
                  );
                },
              ),
      ),
    );
  }

  void _deleteTask(int index) {
    setState(() {
      validTasks.removeAt(index);
    });
  }
}
