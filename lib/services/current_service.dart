import 'package:http/http.dart';

abstract class CurrentService {
  Future<Response> getCurrentData(String lat, String lon);
}
