import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:monitor_presensi/providers/kehadiran_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Presensi Siswa"),
        backgroundColor: Colors.blue,
      ),
      body: Consumer<AttendanceProvider>(
        builder: (context, provider, _) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue),
            ),
            child: Column(
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
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue
                    ),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: provider.mahasiswas.any((mahasiswa) => mahasiswa.isPresent)
                      ? () {
                          provider.saveAttendance();
                        } 
                      : null,
                    child: const Text(
                      "Simpan", 
                      style: TextStyle(color: Colors.black),
                      ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
