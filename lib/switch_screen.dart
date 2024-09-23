
import 'package:flutter/material.dart';
import 'package:daily_manager/start_screen.dart' as start;
import 'package:daily_manager/task_screen.dart';

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({super.key});
  @override
  State<SwitchScreen> createState() {
    return _SwitchScreenState();
  }
}

class _SwitchScreenState extends State<SwitchScreen> {
  var activeScreen = 'start-screen';
    
  void changeScreen() {
    setState(() {
      activeScreen = 'task-screen';
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromARGB(255, 0, 0, 0), Colors.blueGrey],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen == 'start-screen'
              ? start.StartScreen(changeScreen)
              : const TaskScreen(),
        ),
      ),
    );
  }
}
