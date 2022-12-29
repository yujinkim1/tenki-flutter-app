import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tenki/utilities/cert.dart';
import 'package:tenki/providers/current_weather.dart';
import 'package:tenki/utilities/location.dart';

class OpenWeatherApi {
  Future<CurrentWeather> fetchCurrentWeather() async {
    //MARK: 1-GEOLOCATOR LOCATION(=HIGH)
    Location location = Location();
    await location.getCurrentLocation();
    Map<String, String?> parameters;

    //MARK: 2-CERTIFIATION CUSTOM CONSTANT PARARMETERS
    var customParameters = {
      "appid": Certification.appid,
      "lat": location.latitude.toString(),
      "lon": location.longitude.toString(),
      "units": "metric",
      "lang": "kr"
    };
    parameters = customParameters;

    //MARK: 3-USING HTTPS AUTHOR & PATH QUERY
    var uri = Uri.https(Certification.domain, Certification.path, parameters);

    print("request: ${uri.toString()}");

    var response = await http.get(uri);

    print('response: ${response.body}');

    //MARK: 4-IS RESPONSE == 200
    if (response.statusCode == 200) {
      return CurrentWeather.fromJson(json.decode(response.body));
    } else {
      throw Future.error("API 서버와 통신 상태가 원활하지 않아요");
    }
  }
}
