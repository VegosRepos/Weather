import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    splashScreenDelay();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Shimmer(
                period: Duration(milliseconds: 1000),
                child: Text('Loading screen', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25)),
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.blue, Colors.red]))));
  }


  Future<void> splashScreenDelay() async {
    await Future.delayed(Duration(milliseconds: 3000));
    Navigator.pushNamed(context, '/home');
  }
}
