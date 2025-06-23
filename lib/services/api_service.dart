import 'dart:convert';

import 'package:http/http.dart' as http;

/// Simple HTTP service that fetches JSON placeholder content.
class ApiService {
  const ApiService();

  /// Fetches a post from jsonplaceholder.typicode.com and returns the decoded
  /// JSON map.
  Future<Map<String, dynamic>> fetchExamplePost() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    }
    throw Exception('Failed to fetch data');
  }
}
