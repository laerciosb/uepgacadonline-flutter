class Discipline {
  int absences;
  String className;
  String cod;
  int frequency;
  int plannedClasses;
  int givenClasses;
  double grade1;
  double grade2;
  double gradeE;
  String mean;
  String name;
  String status;
  String year;

  Discipline.fromJson(Map<String, dynamic> json) {
    absences = json['absences'];
    className = json['className'];
    cod = json['cod'];
    frequency = json['frequency'];
    plannedClasses = json['plannedClasses'];
    givenClasses = json['givenClasses'];
    grade1 = json['grade1'];
    grade2 = json['grade2'];
    gradeE = json['gradeE'];
    mean = json['mean'];
    name = json['name'];
    status = json['status'];
    year = json['year'];
  }
}