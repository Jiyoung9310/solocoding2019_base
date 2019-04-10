import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// This widget is the root of your application.
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new MyAppState();
}

class MyAppState extends State<MyApp> {
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

  Widget _getTodayWeather() {
    return Column (
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text('용인시', style: TextStyle(color: Colors.white),),
              Text('맑음', style: TextStyle(color: Colors.white, fontSize: 32.0),),
              Text('10°C', style: TextStyle(color: Colors.white),),
              Image.network('https://openweathermap.org/img/w/01d.png'),
              Text('2019년 4월 10일', style: TextStyle(color: Colors.white),),
              Text('AM 10:16', style: TextStyle(color: Colors.white),),
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
