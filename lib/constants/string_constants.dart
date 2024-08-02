import 'package:flutter_dotenv/flutter_dotenv.dart';

String? openWeatherBaseUrl = dotenv.env['OPENWEATHER_BASE_URL'];
String? openWeatherAPIKey = dotenv.env['OPENWEATHER_API_KEY'];

String? unsplashBaseUrl = dotenv.env['UNSPLASH_BASE_URL'];
String? unsplashAPIKey = dotenv.env['UNSPLASH_ACCESS_KEY'];

String? jokesBaseUrl = dotenv.env['JOKES_BASE_URL'];