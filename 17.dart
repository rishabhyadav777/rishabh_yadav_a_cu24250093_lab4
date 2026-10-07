import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: StudentScreen(),
  ));
}

class Student {
  String name;
  String roll;
  String course;

  Student(this.name, this.roll, this.course);
}

class StudentScreen extends StatefulWidget {
  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  final nameController = TextEditingController();
  final rollController = TextEditingController();
  final courseController = TextEditingController();
  final searchController = TextEditingController();

  List<Student> students = [
    Student('Rishabh', '101', 'BCA'),
    Student('Rahul', '102', 'BCA'),
  ];

  List<Student> filteredStudents = [];

  @override
  void initState() {
    super.initState();
    filteredStudents = students;
  }

  void addStudent() {
    if (nameController.text.isNotEmpty &&
        rollController.text.isNotEmpty &&
        courseController.text.isNotEmpty) {
      setState(() {
        students.add(
          Student(
            nameController.text,
            rollController.text,
            courseController.text,
          ),
        );

        filteredStudents = students;

        nameController.clear();
        rollController.clear();
        courseController.clear();
      });
    }
  }

  void searchStudent(String value) {
    setState(() {
      filteredStudents = students
          .where((student) =>
          student.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  void deleteStudent(int index) {
    setState(() {
      students.remove(filteredStudents[index]);
      filteredStudents = students;
    });
  }

  Widget inputField(
      TextEditingController controller,
      String label,
      ) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Records'),
      ),
      body: Column(
        children: [
          inputField(nameController, 'Student Name'),
          inputField(rollController, 'Roll Number'),
          inputField(courseController, 'Course'),

          ElevatedButton(
            onPressed: addStudent,
            child: Text('Add Student'),
          ),

          Padding(
            padding: EdgeInsets.all(8),
            child: TextField(
              controller: searchController,
              onChanged: searchStudent,
              decoration: InputDecoration(
                labelText: 'Search Student',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: filteredStudents.length,
              itemBuilder: (context, index) {
                final student = filteredStudents[index];

                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(student.roll),
                    ),
                    title: Text(student.name),
                    subtitle: Text(
                      'Roll: ${student.roll}\nCourse: ${student.course}',
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        deleteStudent(index);
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}