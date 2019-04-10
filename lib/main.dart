import 'package:flutter/material.dart';
import 'package:solocoding2019_base/model/weather_model.dart';
import 'package:weather/weather.dart';

void main() => runApp(MyApp());

// This widget is the root of your application.
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new MyAppState();
}

class MyAppState extends State<MyApp> {

  Weather weatherData;

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
          child: _getTodayWeather(), // center text
        ),
      ),
    );
  }

  loadWeatherData() async {
    setState(() {
      weatherData = getWeatherData();
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
              Text(weatherData.areaName, style: TextStyle(color: Colors.white),),
              Text(weatherData.weatherDescription, style: TextStyle(color: Colors.white, fontSize: 32.0),),
              Text('${weatherData.tempMin.celsius}°C/${weatherData.tempMax.celsius}°C', style: TextStyle(color: Colors.white),),
              Image.network(weatherData.weatherIcon),
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
