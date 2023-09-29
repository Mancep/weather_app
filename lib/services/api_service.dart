import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/remote.dart';
import 'package:weather_app/services/weather_service.dart';

class ApiService extends WeatherService {
  @override
  Future<Response> getWeatherData(String city) async {
    Map<String, String> queryParameters = {
      'q': city,
      'appid': '43ea6baaad7663dc17637e22ee6f78f2',
      'units': 'metric'
    };

    final response = await get(Uri.https(
      RemoteUrls.baseUrl,
      RemoteUrls.endPoint,
      queryParameters,
    ));

    return response;
  }
}
