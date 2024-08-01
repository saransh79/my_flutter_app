import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_flutter/constants/string_constants.dart';
import 'package:learn_flutter/models/unsplash_image_model.dart';
import 'package:learn_flutter/services/unsplash_api_service.dart';

final unsplashApiServiceProvider = Provider<UnsplashApiService>((ref) {
  return UnsplashApiService(baseUrl: unsplashBaseUrl!, apiKey: unsplashAPIKey!);
});

final unsplashProvider =
    FutureProvider.family<UnsplashImage, String>((ref, city) {
  final apiService = ref.read(unsplashApiServiceProvider);
  return apiService.fetchCityImage(city);
});
