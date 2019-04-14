import 'dart:async' show Future;
import 'dart:io' show Platform;
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:solocoding2019_base/data/http_define.dart';
import 'package:solocoding2019_base/data/weather_data.dart';


class WeatherApi {
  String _apiKey = "ec5155520dbc4cfb4613b6a18205e051";
  http.Client client = new http.Client();

  Future<WeatherData> getWeatherData() async {
    String url = await _generateUrl(tag: HttpDefine.TAG_WEATHER);
    http.Response response = await client.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> currentWeather = json.decode(response.body);
      print('result : $currentWeather');
      return new WeatherData.fromJson(currentWeather);
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  /*Future<List<Weather>> getFiveDayWeather() async {
    List<Weather> forecasts = await weatherStation.fiveDayForecast();
    return forecasts;
  }*/

  Future<String> _generateUrl({String tag}) async {
    LocationData currentLocation;
    var location = new Location();
    String result;
    try {
      currentLocation = await location.getLocation();

      double lat = currentLocation.latitude;
      double lon = currentLocation.longitude;
      result = HttpDefine.BASE_WEATHER_API_URL + '$tag?lat=$lat&lon=$lon&appid=$_apiKey';
    } catch (e) {
      result = HttpDefine.BASE_WEATHER_API_URL + '$tag?id=1835847&appid=$_apiKey';
    }

    print('http req : $result');
    return result;
  }
}
