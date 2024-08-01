import 'dart:convert';

import 'package:learn_flutter/constants/string_constants.dart';
import 'package:learn_flutter/models/unsplash_image_model.dart';
import 'package:http/http.dart' as http;

class UnsplashApiService{
  final String baseUrl;
  final String apiKey;

  const UnsplashApiService({
    required this.baseUrl,
    required this.apiKey
  });

  Future<UnsplashImage> fetchCityImage(String city) async{
    final query = '$city weather people';
    final response = await http.get(Uri.parse('$unsplashBaseUrl/search/photos?query=$query&client_id=$apiKey'));

    if(response.statusCode == 200){
      final json = jsonDecode(response.body);
      final imageJson = json['results'][0]; // Get the first image result
      return UnsplashImage.fromJson(imageJson);
    } 
    else{
      throw Exception(response.reasonPhrase);
    }
  }
}