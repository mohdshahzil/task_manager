// import 'package:flutter/material.dart';

// class NewTaskScreen extends StatefulWidget {
//   const NewTaskScreen({super.key});

//   @override
//   State<NewTaskScreen> createState() => _NewTaskScreenState();
// }

// class _NewTaskScreenState extends State<NewTaskScreen> {
//   final _titleController = TextEditingController();
//   String _selectedCategory = 'UI Design';
//   final List<String> _categories = ['UI Design', 'Project'];
//   final List<String> _selectedImages = [];
//   final List<String> _availableImages = [
//     'assets/images/avatar1.png',
//     'assets/images/avatar2.png',
//     'assets/images/avatar3.png',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'New Task',
//           style: TextStyle(color: Colors.black),
//         ),
//         backgroundColor: Colors.white,
//         iconTheme: const IconThemeData(color: Colors.black),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Task Title
//             const Text(
//               'Title of the Task:',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 8),
//             TextField(
//               controller: _titleController,
//               decoration: InputDecoration(
//                 hintText: 'Enter task title',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 24),

//             // Task Category
//             const Text(
//               'Category:',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 8),
//             DropdownButtonFormField<String>(
//               value: _selectedCategory,
//               items: _categories
//                   .map((category) => DropdownMenuItem<String>(
//                         value: category,
//                         child: Text(category),
//                       ))
//                   .toList(),
//               onChanged: (value) {
//                 setState(() {
//                   _selectedCategory = value!;
//                 });
//               },
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 24),

//             // Add People to Task
//             const Text(
//               'Add People to the Task:',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 8),
//             Wrap(
//               spacing: 8,
//               children: _availableImages.map((image) {
//                 final isSelected = _selectedImages.contains(image);
//                 return GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       if (isSelected) {
//                         _selectedImages.remove(image);
//                       } else {
//                         _selectedImages.add(image);
//                       }
//                     });
//                   },
//                   child: CircleAvatar(
//                     radius: 30,
//                     backgroundColor:
//                         isSelected ? Colors.blue.withOpacity(0.5) : null,
//                     child: CircleAvatar(
//                       radius: 28,
//                       backgroundImage: AssetImage(image),
//                     ),
//                   ),
//                 );
//               }).toList(),
//             ),
//             const SizedBox(height: 32),

//             // Submit Button
//             Center(
//               child: ElevatedButton(
//                 onPressed: () {
//                   final title = _titleController.text.trim();
//                   if (title.isEmpty) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(
//                         content: Text('Please enter a title for the task.'),
//                       ),
//                     );
//                     return;
//                   }

//                   // Log the task details (replace this with actual save logic)
//                   print('Task Title: $title');
//                   print('Category: $_selectedCategory');
//                   print('Assigned People: $_selectedImages');

//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                       content: Text('Task created successfully!'),
//                     ),
//                   );

//                   Navigator.pop(context);
//                 },
//                 style: ElevatedButton.styleFrom(
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 32, vertical: 12),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//                 child: const Text('Create Task'),
//               ),
//             ),
//           ],
//         ),
//       ),
//       backgroundColor: Colors.white,
//     );
//   }

//   @override
//   void dispose() {
//     _titleController.dispose();
//     super.dispose();
//   }
// }



import 'package:flutter/material.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  _NewTaskScreenState createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  final _titleController = TextEditingController();
  String _selectedCategory = 'UI Design';
  final List<String> _categories = ['UI Design', 'Project'];
  final List<String> _selectedImages = [];
  final List<String> _availableImages = [
    'assets/images/avatar1.png',
    'assets/images/avatar2.png',
    'assets/images/avatar3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'New Task',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Task Title
            const Text(
              'Title of the Task:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: 'Enter task title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Task Category
            const Text(
              'Category:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: _selectedCategory,
              items: _categories
                  .map((category) => DropdownMenuItem<String>(
                        value: category,
                        child: Text(category),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCategory = value!;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Add People to Task
            const Text(
              'Add People to the Task:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: _availableImages.map((image) {
                final isSelected = _selectedImages.contains(image);
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        _selectedImages.remove(image);
                      } else {
                        _selectedImages.add(image);
                      }
                    });
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: isSelected ? Colors.blue.withOpacity(0.5) : null,
                    child: CircleAvatar(
                      radius: 28,
                      backgroundImage: AssetImage(image),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 32),

            // Submit Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  final title = _titleController.text.trim();
                  if (title.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please enter a title for the task.'),
                      ),
                    );
                    return;
                  }

                  // Create the task object and return it to the previous screen
                  final newTask = {
                    'title': title,
                    'category': _selectedCategory,
                    'assignedImages': _selectedImages,
                  };

                  // Return the newly created task back to the HomeScreen
                  Navigator.pop(context, newTask); 
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Create Task'),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }
}