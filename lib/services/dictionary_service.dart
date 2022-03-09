import 'dart:convert';
import 'package:dictionary_app_tr/models/words_response.dart';
import 'package:http/http.dart' as http;

class DictionaryServices {
  Future<List<String>> searchWord(String word) async {
    Uri url = Uri.parse('https://sozluk.gov.tr/gts?ara=$word');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      if (result[0] != null) {
        KelimelerResponse kelimelerResponse =
            KelimelerResponse.fromJson(result[0]);
        List<String> anlamlar = [];
        for (AnlamlarList anlam in kelimelerResponse.anlamlarList!) {
          anlamlar.add(anlam.anlam!);
        }
        return anlamlar;
      }
    }
    throw Exception('Bad Request');
  }
}
