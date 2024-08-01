import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_flutter/constants/string_constants.dart';
import 'package:learn_flutter/models/weather_model.dart';
import '../services/weather_api_service.dart';

final weatherApiServiceProvider = Provider<WeatherApiService>((ref) {
  return WeatherApiService(baseUrl: baseUrl!, apiKey: weatherAPIKey!);
});

final weatherProvider = FutureProvider.family<Weather, String>((ref, city) {
  final apiService = ref.read(weatherApiServiceProvider);
  return apiService.fetchWeather(city);
});
