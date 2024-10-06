import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/surah_model.dart';

class ApiService {
  Future<List<Surah>> fetchSurah() async {
    final response =
        await http.get(Uri.parse('https://open-api.my.id/api/quran/surah'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body);

      // Periksa apakah jsonResponse berisi data yang valid
      if (jsonResponse.isNotEmpty) {
        return jsonResponse.map((surah) => Surah.fromJson(surah)).toList();
      } else {
        throw Exception('Surah list is empty or null');
      }
    } else {
      throw Exception('Failed to load surah: ${response.statusCode}');
    }
  }
}
