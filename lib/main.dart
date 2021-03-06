import 'package:flutter/material.dart';
import 'package:solocoding2019_base/data/weather_data.dart';
import 'package:solocoding2019_base/model/weather_model.dart';

void main() => runApp(MyApp());

// This widget is the root of your application.
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new MyAppState();
}

class MyAppState extends State<MyApp> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = new GlobalKey<RefreshIndicatorState>();

  WeatherApi api = new WeatherApi();
  WeatherData weatherData;
  //Weather weatherData;


  @override
  void initState() {
    super.initState();
    //loadWeatherData();

    WidgetsBinding.instance
        .addPostFrameCallback((_) => _refreshIndicatorKey.currentState.show());
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
          actions: <Widget>[
            new IconButton(
                icon: const Icon(Icons.refresh),
                tooltip: 'Refresh',
                onPressed: () {
                  _refreshIndicatorKey.currentState.show();
                }),
          ],
        ),
        body: RefreshIndicator(
            key: _refreshIndicatorKey,
            onRefresh: _refresh,
            child: ListView(children: [
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Center(
                  child: weatherData!=null ? _getTodayWeather() : Container()
                ),
              )
            ]))
      ),
    );
  }

  Future<dynamic> _refresh() {
    return loadWeatherData().then((data) {
      setState(() => weatherData = data);
    });
  }

  loadWeatherData() async {
    WeatherData data = await api.getWeatherData();
    return data;
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
              Text('최저${weatherData.tempMin}°C / 최고${weatherData.tempMax}°C', style: TextStyle(color: Colors.white),),
              Image.network('http://openweathermap.org/img/w/${weatherData.weatherIcon}.png'),
              Text('${weatherData.date.year}년 ${weatherData.date.month}월 ${weatherData.date.day}일', style: TextStyle(color: Colors.white),),
              Text('${weatherData.date.hour} : ${weatherData.date.minute}', style: TextStyle(color: Colors.white),),
            ],
          ),
        ),
        /*Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
              icon: Icon(Icons.refresh),
              tooltip: 'Refresh',
              onPressed: () => null,
              color: Colors.white,
          )
        )*/
      ],
    );
  }
}
