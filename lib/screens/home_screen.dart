import 'package:flutter/material.dart';
import 'dart:convert'; // For decoding JSON
import 'package:http/http.dart' as http; // For making HTTP requests
import '../widgets/task_card.dart';
import 'task_details_screen.dart';
import 'new_task.dart'; // Import the New Task Screen

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<dynamic>> tasks;
  List<Map<String, dynamic>> newTasks = []; // List to hold new tasks

  @override
  void initState() {
    super.initState();
    tasks = fetchTasks();
  }

  Future<List<dynamic>> fetchTasks() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load tasks');
    }
  }

  // Function to handle adding a new task
  void addNewTask(Map<String, dynamic> newTask) {
    setState(() {
      newTasks.insert(0, newTask); // Insert the new task at the top
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Task Manager',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // Handle filter action here
              print("Filter icon pressed");
            },
          ),
        ],
      ),
      body: FutureBuilder<List<dynamic>>(
        future: tasks,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No tasks available'));
          } else {
            // Combine new tasks and fetched tasks
            final allTasks = [...newTasks, ...snapshot.data!];

            return ListView.builder(
              itemCount: allTasks.length,
              itemBuilder: (context, index) {
                final task = allTasks[index];
                return TaskCard(
                  title: task['title'],
                  onTap: () async {
                    // Show loader for a few milliseconds
                    showDialog(
                      context: context,
                      barrierDismissible:
                          false, // Prevent dismissal while loading
                      builder: (BuildContext context) {
                        return const Center(
                          child: CircularProgressIndicator(
                              backgroundColor: Colors.grey,
                              color: Colors.black), // Loader
                        );
                      },
                    );

                    // Simulate a delay
                    await Future.delayed(const Duration(milliseconds: 500));

                    // Dismiss the loader
                    if (context.mounted) {
                      Navigator.pop(context);
                    }

                    // Navigate to the TaskDetailsScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TaskDetailsScreen(task: task),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
      // Add the FloatingActionButton
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Navigate to the New Task Screen
          final newTask = await Navigator.push<Map<String, dynamic>>(
            context,
            MaterialPageRoute(builder: (context) => const NewTaskScreen()),
          );

          // If a new task was created, add it to the list
          if (newTask != null) {
            addNewTask(newTask);
          }
        },
        child: const Icon(
          Icons.person_add,
          color: Colors.white,
        ), // Icon for the button (Add icon)
        backgroundColor: const Color(0xFF3278F5),
        shape: const CircleBorder(), // Color for the button
      ),
    );
  }
}
