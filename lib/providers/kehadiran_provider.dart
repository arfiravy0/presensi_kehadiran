import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Siswa {
  String name;
  bool isPresent;

  Siswa({required this.name, this.isPresent = false});
}

class KehadiranRecord {
  String date;
  int presentCount;
  int absentCount;
  List<String> presentStudents;
  List<String> absentStudents;

  KehadiranRecord({
    required this.date,
    required this.presentCount,
    required this.absentCount,
    required this.presentStudents,
    required this.absentStudents,
  });
}

class KehadiranProvider with ChangeNotifier {
  List<Siswa> students = [
    Siswa(name: 'Ali'),
    Siswa(name: 'Budi'),
    Siswa(name: 'Citra'),
  ];

  List<KehadiranRecord> history = [];

  void saveKehadiran() {
    final date = DateFormat('dd MMM yyyy').format(DateTime.now());
    final presentStudents = students
        .where((s) => s.isPresent)
        .map((s) => s.name)
        .toList();
    final absentStudents = students
        .where((s) => !s.isPresent)
        .map((s) => s.name)
        .toList();
    final presentCount = presentStudents.length;
    final absentCount = absentStudents.length;

    history.insert(
      0,
      KehadiranRecord(
        date: date,
        presentCount: presentCount,
        absentCount: absentCount,
        presentStudents: presentStudents,
        absentStudents: absentStudents,
      ),
    );

    // Resetkan status kehadiran
    for (var student in students) {
      student.isPresent = false;
    }

    notifyListeners();
  }
}