import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:monitor_presensi/providers/kehadiran_provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Presensi Siswa")),
      body: Consumer<AttendanceProvider>(
        builder: (context, provider, _) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: provider.mahasiswas.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(provider.mahasiswas[index].name),
                      trailing: Checkbox(
                        value: provider.mahasiswas[index].isPresent,
                        onChanged: (value) {
                          provider.toggleAttendance(index);
                        },
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: provider.mahasiswas.any((mahasiswa) => mahasiswa.isPresent)
                      ? () {
                          provider.saveAttendance();
                        }
                      : null,
                  child: Text("Simpan"),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
