import 'package:http/http.dart';

abstract class WeatherService {
  Future<Response> getWeatherData(String city);
}
