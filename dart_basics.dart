void main() {
  // Variables
  String studentName = "Campus Connect Student";
  int age = 20;
  double cgpa = 9.2;
  bool isStudent = true;

  print("===== DART BASICS =====");
  print("Name: $studentName");
  print("Age: $age");
  print("CGPA: $cgpa");
  print("Student: $isStudent");

  // Function with default parameter
  printGreeting(studentName);
  printGreeting();

  // For loop + if/else
  print("\n===== GRADES =====");

  List<int> marks = [92, 85, 76, 68, 55];

  for (int mark in marks) {
    if (mark >= 90) {
      print("$mark -> Grade A+");
    } else if (mark >= 80) {
      print("$mark -> Grade A");
    } else if (mark >= 70) {
      print("$mark -> Grade B");
    } else if (mark >= 60) {
      print("$mark -> Grade C");
    } else {
      print("$mark -> Grade D");
    }
  }

  // Map iteration
  print("\n===== SUBJECTS =====");

  Map<String, int> subjects = {
    "Artificial Intelligence": 92,
    "Machine Learning": 88,
    "Database Management": 84,
    "Web Development": 90,
  };

  subjects.forEach((subject, mark) {
    print("$subject : $mark");
  });

  // Class
  Student student = Student(
    name: "Campus Connect Student",
    branch: "AIML",
    year: 3,
  );

  print("\n===== STUDENT OBJECT =====");
  student.displayDetails();
}

void printGreeting([String name = "Student"]) {
  print("Hello, $name!");
}

class Student {
  final String name;
  final String branch;
  final int year;

  Student({
    required this.name,
    required this.branch,
    required this.year,
  });

  void displayDetails() {
    print("Name: $name");
    print("Branch: $branch");
    print("Year: $year");
  }
}