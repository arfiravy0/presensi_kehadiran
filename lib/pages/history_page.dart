import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/kehadiran_provider.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<KehadiranProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Kehadiran'),
        backgroundColor: const Color.fromARGB(255, 41, 197, 192),
      ),
      body: ListView.builder(
        itemCount: provider.history.length,
        itemBuilder: (context, index) {
          final record = provider.history[index];
          return ListTile(
            title: Text(record.date),
            subtitle: Text(
              'Hadir: ${record.presentCount}, Tidak Hadir: ${record.absentCount}',
            ),
            trailing: IconButton(
              icon: Icon(Icons.info_outline),
              onPressed: () => _showDetailAttendance(context, record),
            ),
          );
        },
      ),
    );
  }

  void _showDetailAttendance(BuildContext context, KehadiranRecord record) {
    final presentStudents = record.presentStudents;
    final absentStudents = record.absentStudents;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Detail Kehadiran (${record.date})'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hadir:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                if (presentStudents.isNotEmpty)
                  ...presentStudents.map((name) => Text(name)).toList()
                else
                  Text('Tidak ada siswa hadir.'),
                SizedBox(height: 10),
                Text(
                  'Tidak Hadir:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                if (absentStudents.isNotEmpty)
                  ...absentStudents.map((name) => Text(name)).toList()
                else
                  Text('Semua siswa hadir.'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Tutup'),
            ),
          ],
        );
      },
    );
  }
}