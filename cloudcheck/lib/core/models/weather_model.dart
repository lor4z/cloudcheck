class Weather {
  final String cityName;
  final double temperature;
  final String mainCondition;
  final double maxTemp;
  final double minTemp;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.mainCondition,
    required this.maxTemp,
    required this.minTemp,
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
    );
  }
}
