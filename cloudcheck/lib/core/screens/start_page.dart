import 'package:flutter/material.dart';
import 'package:cloudcheck/core/models/weather_model.dart';
import 'package:cloudcheck/core/services/weather_service.dart';

class StartHome extends StatefulWidget {
  const StartHome({super.key});

  @override
  State<StartHome> createState() => _StartHomeState();
}

class _StartHomeState extends State<StartHome> {
  final WeatherService _weatherService = WeatherService();
  Weather? _weather;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  Future<void> _fetchWeather() async {
    try {
      final weatherData = await _weatherService
          .fetchWeather("São Paulo"); // Mudar para cidade atual depois
      setState(() {
        _weather = Weather.fromJson(weatherData);
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print('Erro ao buscar o clima: $e');
    }
  }

  // 🔹 Método para definir a imagem do clima
  String getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null) return 'assets/images/sol.json';

    switch (mainCondition.toLowerCase()) {
      case 'clouds':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return 'assets/images/nublado.json';
      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return 'assets/images/solChuva.json';
      case 'thunderstorm':
        return 'assets/images/chuva.json';
      case 'clear':
        return 'assets/images/sol.json';
      default:
        return 'assets/images/sol.json';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(29, 38, 72, 1.0),
              Color.fromRGBO(134, 79, 172, 1.0),
            ],
          ),
        ),
        child: Center(
          child: _isLoading
              ? CircularProgressIndicator()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 🔹 Nome da cidade acima da imagem
                    Text(
                      _weather?.cityName ?? "Carregando...",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                      textAlign: TextAlign.center,
                    ),

                    SizedBox(height: 10), // Espaço entre o texto e a imagem

                    // 🔹 Exibe a imagem de acordo com o clima atual
                    Image.asset(getWeatherAnimation(_weather?.mainCondition)),

                    Text(
                      '${_weather?.temperature.round() ?? "--"}°',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 58,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Text(
                      _weather?.mainCondition ?? "Sem informações",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Text(
                      'Max: ${_weather?.maxTemp.round() ?? "--"}° Min: ${_weather?.minTemp.round() ?? "--"}°',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Image.asset('assets/images/House.png'),
                  ],
                ),
        ),
      ),
    );
  }
}
