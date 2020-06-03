import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather/db/moor_database.dart';
import 'package:weather/podos/WeatherPODO.dart';
import 'package:weather/services/WeatherService.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final controller = TextEditingController();
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  String _zipCode;
  String _countryCode;

  var city = '';
  var country = '';
  var date = '';
  var temperature = 0;
  var visibleMain = false;
  var visibleLoading = false;
  var visibleError = false;
  var tempColor = Colors.red[200];

  @override
  void initState() {
    getWeatherByCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 300,
                    child: TextField(
                      style: TextStyle(
                          color: Colors.grey[100],
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w400),
                      maxLines: 1,
                      maxLength: 58,
                      cursorColor: Colors.white,
                      controller: controller,
                      decoration: InputDecoration(
                        labelText: "City",
                        fillColor: Colors.white,
                        labelStyle: TextStyle(color: Colors.grey[100]),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20)),
                            borderSide: BorderSide(color: Colors.blue[100])),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue[100]),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20)),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 62.5,
                    decoration: BoxDecoration(
                        color: Colors.blue[100],
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(25.0),
                            bottomRight: Radius.circular(25.0))),
                    child: FlatButton(
                      colorBrightness: Brightness.dark,
                      onPressed: () async {
                        FocusScope.of(context).requestFocus(FocusNode());
                        setState(() {
                          visibleError = false;
                          visibleMain = false;
                          visibleLoading = true;
                        });
                        var data =
                            await WeatherService().getWeather(controller.text);
                        showResult(data);
                      },
                      child: Icon(Icons.search),
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: visibleMain,
              child: Container(
                  height: 400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.wb_sunny,
                        color: Colors.white,
                        size: 40,
                      ),
                      Text('$city, $country',
                          style: TextStyle(
                              color: Colors.grey[100],
                              fontSize: 40,
                              fontWeight: FontWeight.bold)),
                      Text('$date',
                          style: TextStyle(
                              color: Colors.grey[100],
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold)),
                      Container(
                        alignment: Alignment.center,
                        height: 150,
                        width: 200,
                        margin: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: tempColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: Text(
                          '$temperature°C',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )),
            ),
            Visibility(
              child: Container(
                  margin: EdgeInsets.fromLTRB(0, 200, 0, 0),
                  alignment: Alignment.center,
                  child: SpinKitFadingCircle(
                    color: Colors.white,
                    size: 50,
                  )),
              visible: visibleLoading,
            ),
            Visibility(
              child: Container(
                  margin: EdgeInsets.fromLTRB(0, 200, 0, 0),
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      Center(
                          child: Icon(
                        Icons.mood_bad,
                        color: Colors.white,
                        size: 50,
                      )),
                      Text(
                        'Nothing was found',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ],
                  )),
              visible: visibleError,
            ),
          ],
        ),
      ),
      persistentFooterButtons: <Widget>[
        FloatingActionButton(
          child: Icon(Icons.history),
          elevation: 10,
          onPressed: () {
            Navigator.pushNamed(context, '/historyPage');
          },
        ),
      ],
    );
  }

  void getWeatherByCurrentLocation() async {
    setState(() {
      visibleLoading = true;
    });
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation)
        .then((Position position) async {
      var data = await WeatherService().getWeatherByCoordination(position);
      showResult(data);
    }).catchError((e) {
      print(e);
    });
  }

  void showResult(Weather data) {
    setState(() {
      visibleLoading = false;
      if (data == null) {
        visibleError = true;
        return;
      }
      visibleMain = true;
      city = data.name.toString();
      country = data.sys.country.toString();
      date = DateFormat().add_yMMMMd().format(DateTime.now());
      temperature = data.main.temp.toInt();
      visibleMain = visibleMain;
      if (temperature >= 0) {
        tempColor = Colors.red[200];
      } else {
        tempColor = Colors.blue[300];
      }
    });
    saveCurrentWeatherToHistory();
  }

  void saveCurrentWeatherToHistory() {
    var isWarm = false;
    if (temperature >= 0) {
      isWarm = true;
    }
    final database = Provider.of<AppDatabase>(context);
    final task = Historie(
        temperature: temperature,
        location: '$city, $country',
        date: date,
        isWarm: isWarm);
    database.insertHistory(task);
  }
}
