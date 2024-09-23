import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:daily_manager/task_screen.dart';
import 'package:daily_manager/saved_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: StartScreen(),
        ),
      ),
    );
  }
}

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 0, 0, 0),
            Colors.blueGrey,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight                      ,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/task_manager.png',
            width: 200,
            color: const Color.fromARGB(115, 255, 255, 255),
          ),
          const SizedBox(height: 5),
          Text(
            'Welcome to Daily Manager :)',
            style: GoogleFonts.lato(color: Colors.white, fontSize: 20),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TaskScreen(),
                ),
              );
            },
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
              backgroundColor: const Color.fromARGB(255, 94, 139, 163),
              foregroundColor: const Color.fromARGB(255, 255, 255, 255),
            ),
            child: Text('Add Task',
                style: GoogleFonts.lato(fontSize: 30),
                textAlign: TextAlign.center),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SavedTasks(),
                ),
              );
            },
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              backgroundColor: const Color.fromARGB(255, 94, 139, 163),
              foregroundColor: const Color.fromARGB(255, 255, 255, 255),
            ),
            child: Text('View Task',
                style: GoogleFonts.lato(fontSize: 25),
                textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}
