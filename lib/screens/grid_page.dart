import 'package:flutter/material.dart';
import '../models/surah_model.dart';
import '../api_service.dart';
import 'surah_detail_page.dart';

class GridPage extends StatelessWidget {
  const GridPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Surah - Grid View'),
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

          return GridView.builder(
            padding: const EdgeInsets.all(10.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Jumlah kolom di grid
              crossAxisSpacing: 10.0, // Spasi horizontal antar item
              mainAxisSpacing: 10.0, // Spasi vertikal antar item
              childAspectRatio: 1.5, // Rasio lebar/tinggi item grid
            ),
            itemCount: surahList.length,
            itemBuilder: (context, index) {
              final surah = surahList[index];

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SurahDetailPage(surah: surah),
                    ),
                  );
                },
                child: Card(
                  elevation: 5.0,
                  child: Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          surah.namaLatin, // Menampilkan nama Latin Surah
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          surah.arti, // Menampilkan arti Surah
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
