import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:learn_flutter/models/joke_model.dart';

class JokesApiService {
  final String baseUrl;

  JokesApiService({required this.baseUrl});

  Future<JokesModel> fetchJokes(int page, int limit, String searchTerm) async {
    Map<String, dynamic> queryParams = {
      'page': page.toString(),
      'limit': limit.toString(),
      'term': searchTerm
    };

    final uri = Uri.parse(baseUrl).replace(queryParameters: queryParams);

    final response = await http.get(
      uri,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final jsonBody = jsonDecode(response.body);
      return JokesModel.fromJson(jsonBody);
    } else {
      throw Exception('Failed to load jokes');
    }
  }
}
