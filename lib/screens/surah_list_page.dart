import 'package:flutter/material.dart';
import 'package:quran_apps/screens/surah_detail_page.dart';
import '../models/surah_model.dart';
import '../api_service.dart';

class SurahListPage extends StatelessWidget {
  const SurahListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Surah'),
      ),
      body: FutureBuilder<List<Surah>>(
        future: ApiService().fetchSurah(), // Mengambil data dari API
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No Surah available'));
          }

          final surahList = snapshot.data!;

          return ListView.builder(
            itemCount: surahList.length,
            itemBuilder: (context, index) {
              final surah = surahList[index];
              return ListTile(
                title: Text(surah.nama),
                subtitle: Text(surah.namaLatin),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SurahDetailPage(surah: surah),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
