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
                _buildTag('Category 1', const Color(0xFF767BE3),
                    const Color(0xFFF0F0FA)),
                const SizedBox(width: 8),
                _buildTag(
                    'Category 2',
                    const Color(0xFFDE86A4), // Text color #de86a4
                    const Color(0xFFFAF0F5)),
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
}
