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
    int timezoneOffset = json['timezone'] ?? 0; // Offset em segundos

    return Weather(
      cityName: json['name'] ?? "Desconhecido",
      temperature: (json['main']['temp'] ?? 0.0).toDouble(),
      mainCondition: json['weather'][0]['main'] ?? "N/A",
      maxTemp: (json['main']['temp_max'] ?? 0.0).toDouble(),
      minTemp: (json['main']['temp_min'] ?? 0.0).toDouble(),
      sunrise: DateTime.fromMillisecondsSinceEpoch(
        (json['sys']['sunrise'] ?? 0) * 1000,
        isUtc: true,
      ).add(Duration(seconds: timezoneOffset)), // Corrige fuso horário
      sunset: DateTime.fromMillisecondsSinceEpoch(
        (json['sys']['sunset'] ?? 0) * 1000,
        isUtc: true,
      ).add(Duration(seconds: timezoneOffset)), // Corrige fuso horário
    );
  }

  String formatTime(DateTime time) {
    return DateFormat.Hm().format(time.toLocal());
  }
}
