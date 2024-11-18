import 'package:flutter/material.dart';
import 'package:presensi_kehadiran/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'providers/attendance_provider.dart';
import 'home_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AttendanceProvider(),
      child: MaterialApp(
        home: HomePage(),
      ),
    ),
  );
}