import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:monitor_presensi/providers/kehadiran_provider.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Riwayat Kehadiran")),
      body: Consumer<AttendanceProvider>(
        builder: (context, provider, _) {
          return ListView.builder(
            itemCount: provider.kehadirans.length,
            itemBuilder: (context, index) {
              var history = provider.kehadirans[index];
              return ListTile(
                title: Text("${history.date.toLocal()}"),
                subtitle: Text(
                  "Hadir: ${history.presentCount}, Tidak Hadir: ${history.absentCount}",
                ),
              );
            },
          );
        },
      ),
    );
  }
}
