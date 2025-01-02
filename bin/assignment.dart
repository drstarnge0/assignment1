//abstract class role//
abstract class Role {
  void displayRole();
}

//person class//
class Person {
  String name;
  int age;
  String address;
  Role? role;

  Person(this.name, this.age, this.address);

  void setRole(Role role) {
    this.role = role;
  }

  void displayRole() {
    role?.displayRole();
  }
}

//Student Class//
class Student extends Person implements Role {
  String studentID;
  String grade;
  List<int> courseScores;

  Student(
      String name, int age, String address, this.studentID, this.grade, this.courseScores)
      : super(name, age, address);

  @override
  void displayRole() {
    print("Role: Student");
  }

  double calculationAverageScore() {
    int sum = courseScores.reduce((a, b) => a + b);
    return sum / courseScores.length;
  }
}

//Teacher Class//
class Teacher extends Person implements Role {
  String teacherID;
  List<String> courseTaught;

  Teacher(
      String name, int age, String address, this.teacherID, this.courseTaught)
      : super(name, age, address);

  @override
  void displayRole() {
    print("Role: Teacher");
  }

  void displayCoursesTaught() {
    print("Courses Taught:");
    for (var course in courseTaught) {
      print("-$course");
    }
  }
}

//StudentManagementSystem class//
void main() {
  Student student = Student(
      "Rimon", 27, "Gopalpur,Lalpur,Natore", "R50", "A", [90, 95, 100]);

  student.setRole(student);
  student.displayRole();
  print("Name: ${student.name}");
  print("Age: ${student.age}");
  print("Address: ${student.address}");
  print("Average Score: ${student.calculationAverageScore()}");
  print("\n");

  Teacher teacher = Teacher(
      "Arif Biswas", 34, "Tilakpur,Lalpur,Natore", "A44", ["Math", "English", "Bangla"]);

  teacher.setRole(teacher);
  teacher.displayRole();
  print("Name: ${teacher.name}");
  print("Age: ${teacher.age}");
  print("Address: ${teacher.address}");
  teacher.displayCoursesTaught();
}
