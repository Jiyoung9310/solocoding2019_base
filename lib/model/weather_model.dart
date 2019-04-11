import 'dart:async' show Future;
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:solocoding2019_base/data/weather_data.dart';


class WeatherApi {
  String _apiKey = "ec5155520dbc4cfb4613b6a18205e051";
  http.Client client = new http.Client();
  static const String FORECAST = 'forecast';
  static const String WEATHER = 'weather';


  Future<WeatherData> getWeatherData() async {
    String url = 'http://api.openweathermap.org/data/2.5/weather' +
        '?lat=0.0&lon=0.0&appid=$_apiKey'; //await _generateUrl(tag: WEATHER);
    http.Response response = await client.get(url);
    Map<String, dynamic> currentWeather = json.decode(response.body);
    return new WeatherData.fromJson(currentWeather);
  }

  /*Future<List<Weather>> getFiveDayWeather() async {
    List<Weather> forecasts = await weatherStation.fiveDayForecast();
    return forecasts;
  }*/

  Future<String> _generateUrl({String tag}) async {
    Map<String, double> loc = await new Location().getLocation();
    double lat = loc['latitude'];
    double lon = loc['longitude'];
    return 'http://api.openweathermap.org/data/2.5/' +
        '$tag?lat=$lat&lon=$lon&appid=$_apiKey';
  }
}
