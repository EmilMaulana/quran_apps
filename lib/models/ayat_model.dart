// lib/models/ayat_model.dart

class Ayat {
  final int nomorAyat;
  final String teksArab;
  final String teksLatin;
  final String terjemahan;

  Ayat({
    required this.nomorAyat,
    required this.teksArab,
    required this.teksLatin,
    required this.terjemahan,
  });

  factory Ayat.fromJson(Map<String, dynamic> json) {
    return Ayat(
      nomorAyat: json['number']['inSurah'],
      teksArab: json['text']['arab'],
      teksLatin: json['text']['transliteration']['en'],
      terjemahan: json['translation']['id'],
    );
  }

  String? get transliterasi => null;
}
