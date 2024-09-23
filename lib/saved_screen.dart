import 'package:flutter/material.dart';
import 'package:daily_manager/task.dart';
import 'package:google_fonts/google_fonts.dart';

class SavedTasks extends StatelessWidget {
  const SavedTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Tasks'),
      ),
      body: Container(
        decoration:const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 0, 0, 0),
              Colors.blueGrey,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView.builder(
          itemCount: savedTasks.length,
          itemBuilder: (context, index) {
            final task = savedTasks[index];
            return ListTile(
              title: Text(
                task.title,
                style: GoogleFonts.lato(fontSize: 30),
              ),
              subtitle: Text(
                task.description,
                style: GoogleFonts.lato(fontSize: 20),
              ),
            );
          },
        ),
      ),
    );
  }
}
