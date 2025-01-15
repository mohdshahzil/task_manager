import 'package:flutter/material.dart';
import '../utils/string_extensions.dart'; // Import the extension

class TaskCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const TaskCard({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title.toTitleCase(), // Apply title case
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                _buildTag('UI Design', const Color(0xFF767BE3), const Color(0xFFF0F0FA)),
                const SizedBox(width: 8),
                _buildTag('Project', const Color(0xFFDE86A4), const Color(0xFFFAF0F5)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.message_outlined, size: 18),
                    const SizedBox(width: 4),
                    const Text('3'),
                    const SizedBox(width: 16), // Add spacing between icons
                    const Icon(Icons.attach_file_outlined, size: 18),
                    const SizedBox(width: 4),
                    const Text('1'),
                  ],
                ),
                Row(
                  children: [
                    _buildAvatar('assets/images/avatar1.png'),
                    _buildAvatar('assets/images/avatar2.png'),
                    _buildAvatar('assets/images/avatar3.png'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTag(String text, Color textColor, Color backgroundColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildAvatar(String imagePath) {
    return CircleAvatar(
      radius: 16,
      backgroundImage: AssetImage(imagePath),
    );
  }
}