import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ResimSaglayici with ChangeNotifier {
  String? _imageURL;
  bool _yukleniyor = false;

  String? get imageURL => _imageURL;
  bool get yukleniyor => _yukleniyor;

  Future<void> fetchRandomImage() async {
    _yukleniyor = true;
    notifyListeners();

    try {
      final response = await http.get(Uri.parse('https://picsum.photos/200/300'));
      if (response.statusCode == 200) {
        _imageURL = response.request?.url.toString();
      } else {
        throw Exception('Görsel alınamadı');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Hata: $e');
      }
    } finally {
      _yukleniyor = false;
      notifyListeners();
    }
  }
}
