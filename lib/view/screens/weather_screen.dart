import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_flutter/models/weather_model.dart';
import 'package:learn_flutter/providers/weather_provider.dart';
import 'package:learn_flutter/widgets/appbar.dart';

class WeatherScreen extends ConsumerWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const city = 'New York'; // Example city
    final weatherAsyncValue = ref.watch(weatherProvider(city));

    return Scaffold(
      appBar: const CustomAppBar(title: 'Weather App',),
      body: Center(
        child: weatherAsyncValue.when(
          data: (weather) => _buildWeatherWidget(context, weather),
          loading: () => const CircularProgressIndicator(),
          error: (error, stack) => Text('Error: $error'),
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
          'Wind Speed: ${weather.windSpeed} m/s',
          style: const TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}

