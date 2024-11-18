import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/kehadiran_provider.dart';

class KehadiranPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<KehadiranProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Presensi Siswa'),
      backgroundColor: const Color.fromARGB(255, 187, 0, 255)),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: provider.students.length,
              itemBuilder: (context, index) {
                final student = provider.students[index];
                return ListTile(
                  title: Text(student.name),
                  trailing: Checkbox(
                    value: student.isPresent,
                    onChanged: (value) {
                      student.isPresent = value ?? false;
                      provider.notifyListeners();
                    },
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: provider.students.isNotEmpty
                ? () => provider.saveKehadiran()
                : null,
            child: Text('Simpan Kehadiran'),
          ),
        ],
      ),
    );
  }  
}