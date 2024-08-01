class Weather {
  final String description;
  final double temperature;
  final double windSpeed;
  final double minTemp;
  final double maxTemp;
  final int pressure;
  final int humidity;
  final int visibility;

  Weather({
    required this.description,
    required this.temperature,
    required this.windSpeed,
    required this.minTemp,
    required this.maxTemp,
    required this.pressure,
    required this.humidity,
    required this.visibility,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      description: json['weather'][0]['description'],
      temperature: json['main']['temp'],
      windSpeed: json['wind']['speed'].toDouble(),
      maxTemp: json['main']['temp_max'],
      minTemp: json['main']['temp_min'],
      pressure: json['main']['pressure'],
      humidity: json['main']['humidity'],
      visibility: json['visibility'],
    );
  }
}
