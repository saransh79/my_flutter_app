import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:learn_flutter/models/weather_model.dart';


class WeatherApiService {
  final String baseUrl;
  final String apiKey;

  WeatherApiService({required this.baseUrl, required this.apiKey});

  Future<Weather> fetchWeather(String city) async {
    final response = await http.get(
      Uri.parse('$baseUrl/weather?q=$city&appid=$apiKey&units=metric'),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return Weather.fromJson(json);
    } else {
      final responsebody = jsonDecode(response.body);
      print('response : $responsebody');
      throw Exception('Failed to load weather data');
    }
  }
}
