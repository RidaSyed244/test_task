import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://api.ulearna.com/bytes/all";

  Future<Map<String, dynamic>> fetchVideos(
      int page, int limit, String country) async {
    final response = await http
        .get(Uri.parse("$baseUrl?page=$page&limit=$limit&country=$country"));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load videos');
    }
  }
}
