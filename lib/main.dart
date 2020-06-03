import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/pages/history.dart';
import 'package:weather/pages/home.dart';
import 'package:weather/pages/splash.dart';

import 'db/moor_database.dart';
import 'pages/histories_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      // The single instance of AppDatabase
      builder: (_) => AppDatabase(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/splash',
        routes: {
          '/home': (context) => Home(),
          '/historyPage': (context) => History(),
          '/splash': (context) => SplashScreen()
        },
        home: HomePage(),
      ),
    );
  }
}
