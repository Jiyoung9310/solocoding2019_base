import 'dart:math';

class WeatherData {
  String areaName, weatherDescription, weatherIcon;
  double temperature, tempMin, tempMax;
  DateTime date, sunrise, sunset;
  int pressure, humidity, cloudiness;
  double windSpeed,
      rainLastHour,
      rainLast3Hours,
      snowLastHour,
      snowLast3Hours;

  WeatherData({this.date, this.sunrise, this.sunset,
    this.areaName, this.weatherDescription, this.weatherIcon,
    this.temperature, this.tempMin, this.tempMax,
    this.pressure, this.windSpeed
    , this.humidity, this.cloudiness
    , this.rainLastHour, this.rainLast3Hours
    , this.snowLastHour, this.snowLast3Hours
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    final rain1Data = json['rain'] == null ? null : json['rain']['1h'];
    final rain3Data = json['rain'] == null ? null : json['rain']['3h'];
    final snow1Data = json['snow'] == null ? null : json['snow']['1h'];
    final snow3Data = json['snow'] == null ? null : json['snow']['3h'];
    return WeatherData(
      date: new DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000, isUtc: false), //데이터 계산 시간, 유닉스, UTC
      sunrise: new DateTime.fromMillisecondsSinceEpoch(json['sys']['sunrise'] * 1000, isUtc: false), //일출 시간, 유닉스, UTC
      sunset: new DateTime.fromMillisecondsSinceEpoch(json['sys']['sunset'] * 1000, isUtc: false), //일몰 시간, 유닉스, UTC
      areaName: json['name'], //도시 이름
      weatherDescription: json['weather'][0]['description'], //그룹 내의 기상 조건
      temperature: json['main']['temp'].toDouble()- 273.15, //온도. 섭씨 계산.
      tempMin: json['main']['temp_min'].toDouble()- 273.15, //순간 최저 온도. 섭씨 계산.
      tempMax: json['main']['temp_max'].toDouble()- 273.15, //순간 최대 온도. 섭씨 계산.
      weatherIcon: json['weather'][0]['icon'], //날씨 아이콘 ID
      pressure: json['main']['pressure'], //대기압, hPa
      windSpeed: json['wind']['speed'], //풍속. 단위 기본값 : meter / sec
      humidity: json['main']['humidity'], //습도, %
      cloudiness: json['clouds']['all'], //흐림, %
      rainLastHour: rain1Data, //지난 1 시간 동안의 비 볼륨, mm
      rainLast3Hours: rain3Data, //지난 3 시간 동안의 비 볼륨, mm
      snowLastHour: snow1Data, //지난 1 시간 동안의 비 볼륨, mm
      snowLast3Hours: snow3Data, //지난 3 시간 동안의 비 볼륨, mm
    );
  }
}