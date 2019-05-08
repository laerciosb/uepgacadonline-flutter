import 'package:flutter/material.dart';
import 'package:uepgacadonline_flutter/models/discipline.dart';

class DisciplineScreen extends StatefulWidget {
  Discipline discipline;

  DisciplineScreen({this.discipline})

  @override
  _DisciplineScreenState createState() => _DisciplineScreenState();
}

class _DisciplineScreenState extends State<DisciplineScreen> {
  @override
  Widget build(BuildContext context) {

    final discipline = widget.discipline;
    final rows = [
      {'title': 'Código', 'value': discipline.cod.toString()},
      {'title': 'Faltas', 'value': discipline.absences.toString()},
      {'title': 'Turma', 'value': discipline.className.toString()},
      {'title': 'Calendário', 'value': discipline.year.toString()},
      {
        'title': 'Aulas Previstas',
        'value': discipline.plannedClasses?.toString() ?? '-'
      },
      {
        'title': 'Aulas Dadas',
        'value': discipline.givenClasses?.toString() ?? '-'
      },
      {'title': 'Faltas', 'value': discipline.absences?.toString() ?? '-'},
      {'title': '1° Semestre', 'value': discipline.grade1?.toString() ?? '-'},
      {'title': '2° Semestre', 'value': discipline.grade2?.toString() ?? '-'},
      {'title': 'Exame', 'value': discipline.gradeE?.toString() ?? '-'},
      {'title': 'Média', 'value': discipline.mean?.toString() ?? '-'},
      {'title': 'Frequência', 'value': discipline.frequency?.toString() ?? '-'},
      {'title': 'Estado', 'value': discipline.status?.toString() ?? '-'},
    ];

    return Container();
  }
}
