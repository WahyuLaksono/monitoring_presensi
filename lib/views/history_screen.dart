import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:monitor_presensi/providers/kehadiran_provider.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Riwayat Kehadiran"),
        backgroundColor: Colors.blue,
        ),
      body: Consumer<AttendanceProvider>(
        builder: (context, provider, _) {
          return Container (
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue)
            ),
            child: ListView.builder(
              itemCount: provider.kehadirans.length,
              itemBuilder: (context, index) {
                var history = provider.kehadirans[index];
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.blue),
                    ),
                  ),
                  child: ListTile(
                    title: Text(
                      "${history.date.toLocal()}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "Hadir: ${history.presentCount}, Tidak Hadir: ${history.absentCount}",
                    ),
                  )
                );
              },  
            )
          );
        },
      ),
    );
  }
}


