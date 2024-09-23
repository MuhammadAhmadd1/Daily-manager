import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                style: GoogleFonts.lato(fontSize: 30),
                textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}
