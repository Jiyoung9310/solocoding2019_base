import 'package:flutter/material.dart';
import 'package:solocoding2019_base/data/weather_data.dart';
import 'package:solocoding2019_base/model/weather_model.dart';
import 'dart:async' show Future;
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

void main() => runApp(MyApp());

// This widget is the root of your application.
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new MyAppState();
}

class MyAppState extends State<MyApp> {

  WeatherApi api = new WeatherApi();
  WeatherData weatherData;


  @override
  void initState() {
    super.initState();
    loadWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    // set material design app
    return MaterialApp(
      title: 'solocoding2019', // application name
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text('Weather App'), // app bar title
        ),
        body: Center(
          child: weatherData!=null ? _getTodayWeather() : Container(), // center text
        ),
      ),
    );
  }

  loadWeatherData() async {
    String _apiKey = "API";
    http.Client client = new http.Client();
    final String FORECAST = 'forecast';
    final String WEATHER = 'weather';
    final lat = 37.3897;
    final lon = 127.1017;

    String url = 'http://api.openweathermap.org/data/2.5/weather' +
        '?lat=$lat&lon=$lon&appid=$_apiKey'; //await _generateUrl(tag: WEATHER);
    http.Response response = await client.get(url);
    Map<String, dynamic> currentWeather = json.decode(response.body);
    return setState(() {
      weatherData = new WeatherData.fromJson(currentWeather);
    });
  }

  Widget _getTodayWeather() {
    return Column (
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(weatherData.name, style: TextStyle(color: Colors.white),),
              Text(weatherData.main, style: TextStyle(color: Colors.white, fontSize: 32.0),),
              Text('${weatherData.temp}°C', style: TextStyle(color: Colors.white),),
              Image.network(weatherData.icon),
              Text('${weatherData.date.year}년 ${weatherData.date.month}월 ${weatherData.date.day}일', style: TextStyle(color: Colors.white),),
              Text('${weatherData.date.hour} : ${weatherData.date.minute}', style: TextStyle(color: Colors.white),),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
              icon: Icon(Icons.refresh),
              tooltip: 'Refresh',
              onPressed: () => null,
              color: Colors.white,
          )
        )
      ],
    );
  }
}
