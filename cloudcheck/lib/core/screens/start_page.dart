import 'package:flutter/material.dart';
import 'package:cloudcheck/core/models/weather_model.dart';
import 'package:cloudcheck/core/services/weather_service.dart';
import 'package:lottie/lottie.dart';
import 'package:intl/intl.dart';

class StartHome extends StatefulWidget {
  const StartHome({super.key});

  @override
  State<StartHome> createState() => _StartHomeState();
}

class _StartHomeState extends State<StartHome> {
  final WeatherService _weatherService = WeatherService();
  Weather? _weather;
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  Future<void> _fetchWeather() async {
    try {
      String city = await _weatherService.getCurrentCity();
      print('Current city: $city');

      final weatherData = await _weatherService.fetchWeather(city);

      setState(() {
        _weather = Weather.fromJson(weatherData);
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        print("Erro de requisição: $e");
        _errorMessage = "Erro na requisição.";
        _isLoading = false;
      });
    }
  }

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

  String formatTime(DateTime? time) {
    return time != null ? DateFormat('HH:mm').format(time) : "--:--";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
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
              ? const CircularProgressIndicator()
              : _errorMessage != null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.error, color: Colors.red, size: 50),
                        const SizedBox(height: 10),
                        Text(
                          _errorMessage!,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _fetchWeather,
                          child: const Text("Tentar Novamente"),
                        ),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 90),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              _weather?.cityName ?? "Carregando...",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),

                        // Animação do Clima
                        Lottie.asset(
                          getWeatherAnimation(_weather?.mainCondition),
                          width: 250,
                          height: 200,
                          fit: BoxFit.contain,
                        ),

                        // Temperatura
                        Column(
                          children: [
                            Text(
                              '${_weather?.temperature.round() ?? "--"}°',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 58,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              _weather?.mainCondition ?? "Sem informações",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              'Max: ${_weather?.maxTemp.round() ?? "--"}° Min: ${_weather?.minTemp.round() ?? "--"}°',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),

                        // Imagem da Casa
                        Expanded(
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Positioned(
                                bottom: 110,
                                child: Image.asset(
                                  'assets/images/House.png',
                                  width: 600,
                                ),
                              ),

                              // horários do sol
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(20),
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(25),
                                      topRight: Radius.circular(25),
                                    ),
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color.fromRGBO(34, 49, 104, 1),
                                        Color.fromRGBO(177, 95, 235, 1),
                                      ],
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize
                                        .min, // Evita que a caixa ocupe todo o espaço
                                    children: [
                                      const Text(
                                        "Horários do Sol",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 26,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Poppins',
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Column(
                                            children: [
                                              Icon(Icons.wb_sunny,
                                                  color: Colors.yellow[700],
                                                  size: 50),
                                              const Text(
                                                "Nascer do Sol",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 19,
                                                  fontFamily: 'Poppins',
                                                ),
                                              ),
                                              Text(
                                                formatTime(_weather?.sunrise),
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Icon(Icons.nightlight_round,
                                                  color: Colors.orange[300],
                                                  size: 50),
                                              const Text(
                                                "Pôr do Sol",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 19),
                                              ),
                                              Text(
                                                formatTime(_weather?.sunset),
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
        ),
      ),
    );
  }
}
