import 'package:flutter_dotenv/flutter_dotenv.dart';

String? baseUrl = dotenv.env['BASE_URL'];
String? weatherAPIKey = dotenv.env['API_KEY'];