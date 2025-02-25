import 'dart:convert';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  static const String _baseUrl =
      'http://api.openweathermap.org/data/2.5/weather';
  final String apiKey = 'ad9118a78368c943a0d798c5fad402e3';

  Future<Map<String, dynamic>> fetchWeather(String cityName) async {
    final response = await http.get(
      Uri.parse('$_baseUrl?q=$cityName&appid=$apiKey&units=metric'),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Falha ao carregar os dados do clima.');
    }
  }

  Future<String> getCurrentCity() async {
    // pega a permissão para o usuario
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    Position position = await Geolocator.getCurrentPosition(
        // ignore: deprecated_member_use
        desiredAccuracy: LocationAccuracy.high);

    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    String? city = placemarks[0].locality;

    return city ?? "";
  }
}
