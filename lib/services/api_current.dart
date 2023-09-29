import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/remote.dart';
import 'package:weather_app/services/current_service.dart';

class ApiCurrent extends CurrentService {
  @override
  Future<Response> getCurrentData(String lat, String lon) async {
    Map<String, String> queryParameters = {
      'lat': lat,
      'lon': lon,
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
