import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AttendanceProvider with ChangeNotifier {
  List<Map<String, dynamic>> _students = [
    {'name': 'Ali', 'isPresent': false},
    {'name': 'Budi', 'isPresent': false},
    {'name': 'Citra', 'isPresent': false},
  ];

  List<Map<String, dynamic>> get students => _students;

  List<Map<String, dynamic>> _attendanceHistory = [];
  List<Map<String, dynamic>> get attendanceHistory => _attendanceHistory;

  void toggleAttendance(int index) {
    _students[index]['isPresent'] = !_students[index]['isPresent'];
    notifyListeners();
  }

  void saveAttendance() {
    int presentCount = _students.where((s) => s['isPresent']).length;
    int absentCount = _students.length - presentCount;
    String date = DateFormat('dd MMM yyyy').format(DateTime.now());

    _attendanceHistory.insert(0, {
      'date': date,
      'present': presentCount,
      'absent': absentCount,
    });

    _students = _students.map((s) {
      s['isPresent'] = false;
      return s;
    }).toList();

    notifyListeners();
  }
}
