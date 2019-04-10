
import 'package:weather/weather.dart';


WeatherStation weatherStation = new WeatherStation("API");

Future<Weather> getWeatherData() async {
  Weather weather = await weatherStation.currentWeather();
  double celsius = weather.temperature.celsius;
  return weather;
}

Future<List<Weather>> getFiveDayWeather() async {
  List<Weather> forecasts = await weatherStation.fiveDayForecast();
  return forecasts;
}