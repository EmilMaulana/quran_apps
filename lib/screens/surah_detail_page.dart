import 'package:flutter/material.dart';
import '../models/surah_model.dart'; // Pastikan model surah diimpor

class SurahDetailPage extends StatelessWidget {
  final Surah surah;

  const SurahDetailPage({super.key, required this.surah});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(surah.namaLatin), // Nilai default jika null
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              surah.nama,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Jumlah Ayat: ${surah.jumlahAyat}',
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              'Tempat Turun: ${surah.tempatTurun}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(surah.deskripsi), // Nilai default jika deskripsi null
          ],
        ),
      ),
    );
  }
}
