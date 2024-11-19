import 'package:flutter/material.dart';
import 'package:monitor_presensi/models/data_layer.dart';

class AttendanceProvider with ChangeNotifier {
  List<Mahasiswa> mahasiswas = [
    Mahasiswa(name: 'Ali', isPresent: false),
    Mahasiswa(name: 'Budi', isPresent: false),
    Mahasiswa(name: 'Citra', isPresent: false),
  ];

  List<Kehadiran> kehadirans = [];

  void toggleAttendance(int index) {
    mahasiswas[index].isPresent = !mahasiswas[index].isPresent;
    notifyListeners();
  }

  void saveAttendance() {
    int presentCount = mahasiswas.where((student) => student.isPresent).length;
    int absentCount = mahasiswas.length - presentCount;

    kehadirans.insert(
      0,
      Kehadiran(
        date: DateTime.now(),
        presentCount: presentCount,
        absentCount: absentCount,
      ),
    );

    mahasiswas.forEach((Mahasiswa) => Mahasiswa.isPresent = false); 
    notifyListeners();
  }
}