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

  KehadiranRecord({
    required this.date,
    required this.presentCount,
    required this.absentCount,
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
    final presentCount = students.where((s) => s.isPresent).length;
    final absentCount = students.length - presentCount;

    history.insert(
      0,
      KehadiranRecord(
        date: date,
        presentCount: presentCount,
        absentCount: absentCount,
      ),
    );

    for (var student in students) {
      student.isPresent = false;
    }

    notifyListeners();
  }
}