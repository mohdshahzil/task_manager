import 'package:flutter/material.dart';

class TaskDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> task;

  const TaskDetailsScreen({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Task Details',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Task assigned avatars at the top
            const Text(
              'Task assigned to:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                _buildAvatar('assets/images/avatar1.png'),
                _buildAvatar('assets/images/avatar2.png'),
                _buildAvatar('assets/images/avatar3.png'),
              ],
            ),
            const SizedBox(height: 24),

            // Task details
            _buildDetailRow('User ID', task['userId'].toString()),
            const SizedBox(height: 16),
            _buildDetailRow('Task ID', task['id'].toString()),
            const SizedBox(height: 16),
            _buildDetailRow('Title', task['title']),
            const SizedBox(height: 16),
            _buildDetailRow(
              'Completed',
              task['completed'] ? "Yes" : "No",
              valueColor: task['completed'] ? Colors.green : Colors.red,
            ),
            const SizedBox(height: 32),

            // Additional Information
            const Text(
              'Additional Notes:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'This task is critical and requires attention to detail. Make sure to complete it on time and coordinate with your team members.',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {Color? valueColor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: valueColor ?? Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildAvatar(String imagePath) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: CircleAvatar(
        radius: 24,
        backgroundImage: AssetImage(imagePath),
        backgroundColor: Colors.white,
      ),
    );
  }
}
