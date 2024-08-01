import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_flutter/models/unsplash_image_model.dart';
import 'package:learn_flutter/models/weather_model.dart';
import 'package:learn_flutter/providers/unsplash_provider.dart';
import 'package:learn_flutter/providers/weather_provider.dart';
import 'package:learn_flutter/widgets/appbar.dart';

class WeatherScreen extends ConsumerStatefulWidget {
  const WeatherScreen({super.key});

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends ConsumerState<WeatherScreen> {
  String city = '';
  final TextEditingController _cityController = TextEditingController();

  @override
  void initState() {
    super.initState;
  }

  @override
  Widget build(BuildContext context) {
    final weatherAsyncValue =
        city.isNotEmpty ? ref.watch(weatherProvider(city)) : null;
    final unsplashAsyncValue =
        city.isNotEmpty ? ref.watch(unsplashProvider(city)) : null;

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Weather App',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _cityController,
                decoration: InputDecoration(
                  labelText: 'Enter city name',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      setState(() {
                        city = _cityController.text;
                      });
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (weatherAsyncValue != null)
              Container(
                child: weatherAsyncValue.when(
                  data: (weather) => _buildWeatherWidget(context, weather),
                  loading: () => const CircularProgressIndicator(),
                  error: (error, stack) => Text('$error'),
                ),
              ),
            const SizedBox(height: 20),
            if (unsplashAsyncValue != null)
              Container(
                padding: const EdgeInsets.all(10),
                child: unsplashAsyncValue.when(
                    data: (img) => _buildCityImage(context, img),
                    error: (error, stack) => Text('$error'),
                    loading: () => const CircularProgressIndicator()),
              )
          ],
        ),
      ),
    );
  }

  Widget _buildWeatherWidget(BuildContext context, Weather weather) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Description: ${weather.description}',
          style: const TextStyle(fontSize: 20),
        ),
        Text(
          'Temperature: ${weather.temperature}°C',
          style: const TextStyle(fontSize: 20),
        ),
        Text(
          'Min Temperature: ${weather.minTemp}°C',
          style: const TextStyle(fontSize: 20),
        ),
        Text(
          'Max Temperature: ${weather.maxTemp}°C',
          style: const TextStyle(fontSize: 20),
        ),
        Text(
          'Wind Speed: ${weather.windSpeed} m/s',
          style: const TextStyle(fontSize: 20),
        ),
        Text(
          'Pressure: ${weather.pressure} hPa',
          style: const TextStyle(fontSize: 20),
        ),
        Text(
          'Humidity: ${weather.humidity} %',
          style: const TextStyle(fontSize: 20),
        ),
        Text(
          'Visibility: ${weather.visibility} m',
          style: const TextStyle(fontSize: 20),
        ),
      ],
    );
  }

  Widget _buildCityImage(BuildContext context, UnsplashImage image) {
    return Image.network(image.imageUrl);
  }
}
