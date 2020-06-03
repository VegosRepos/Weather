import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:weather/podos/WeatherPODO.dart';

class WeatherService {
  var key = '905193c56bf9956005294fda933e896f';
  var city;
  var zipCode;
  var countryCode;
  var mainLink = 'http://api.openweathermap.org/data/2.5/';
  var resultInfo;

  Future<Weather> getWeather(String city) async {
    this.city = city;
    try {
      var link = mainLink + 'weather?q=$city&units=metric&APPID=$key';
      Weather weather;
      Response response = await get(link);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        weather = Weather.fromJson(data);
      }
      resultInfo = weather;
      return resultInfo;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<Weather> getWeatherByCoordination(Position position) async {
    try {
      var link = mainLink +
          'weather?lat=${position.latitude}&lon=${position.longitude}&units=metric&appid=$key';

      Weather weather;
      Response response = await get(link);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        weather = Weather.fromJson(data);
      }
      resultInfo = weather;
      return resultInfo;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
