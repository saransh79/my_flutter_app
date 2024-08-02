import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_flutter/constants/string_constants.dart';
import 'package:learn_flutter/models/joke_model.dart';
import 'package:learn_flutter/services/jokes_api_service.dart';

final jokesApiServiceProvider = Provider<JokesApiService>((ref) {
  return JokesApiService(baseUrl: jokesBaseUrl!);
});

final jokesProvider = FutureProvider.autoDispose
    .family<JokesModel, Map<String, dynamic>>((ref, params) {
  final apiService = ref.read(jokesApiServiceProvider);
  return apiService.fetchJokes(
      params['page'], params['limit'], params['searchTerm']);
});
