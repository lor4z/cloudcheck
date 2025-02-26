import 'package:intl/intl.dart';

class Weather {
  final String cityName;
  final double temperature;
  final String mainCondition;
  final double maxTemp;
  final double minTemp;
  final DateTime sunrise;
  final DateTime sunset;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.mainCondition,
    required this.maxTemp,
    required this.minTemp,
    required this.sunrise,
    required this.sunset,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'] ?? "Desconhecido",
      temperature: (json['main']['temp'] ?? 0.0).toDouble(),
      mainCondition: json['weather'][0]['main'] ?? "N/A",
      maxTemp:
          (json['main']['temp_max'] ?? json['main']['temp'] ?? 0.0).toDouble(),
      minTemp:
          (json['main']['temp_min'] ?? json['main']['temp'] ?? 0.0).toDouble(),
      sunrise: DateTime.fromMillisecondsSinceEpoch(
          (json['sys']['sunrise'] ?? 0) * 1000), // Converter Unix timestamp
      sunset: DateTime.fromMillisecondsSinceEpoch(
          (json['sys']['sunset'] ?? 0) * 1000), // Converter Unix timestamp
    );
  }

  String formatTime(DateTime time) {
    return DateFormat.Hm().format(time); // Formato HH:mm
  }
}
