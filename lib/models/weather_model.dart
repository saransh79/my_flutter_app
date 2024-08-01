class Weather {
  final String description;
  final double temperature;
  final int windSpeed;

  Weather({
    required this.description,
    required this.temperature,
    required this.windSpeed,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      description: json['weather'][0]['description'],
      temperature: json['main']['temp'],
      windSpeed: json['wind']['speed'],
    );
  }
}
