import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/kehadiran_provider.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<KehadiranProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Riwayat Kehadiran'),
      backgroundColor: const Color.fromARGB(255, 170, 98, 233)),
      body: ListView.builder(
        itemCount: provider.history.length,
        itemBuilder: (context, index) {
          final record = provider.history[index];
          return ListTile(
            title: Text(record.date),
            subtitle: Text('Hadir: ${record.presentCount}, Tidak Hadir: ${record.absentCount}'),
          );
        },
      ),
    );
  }
}