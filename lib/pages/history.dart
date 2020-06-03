import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/db/moor_database.dart';
import 'package:weather/pages/histories_page.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Provider(
      builder: (_) => AppDatabase(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: true,
              leading: IconButton(icon:Icon(Icons.arrow_back),
                onPressed:() => Navigator.pop(context),
              ),
              centerTitle: true,
              title: Text(
                'History',
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
            ),
            body: HomePage()),
      ),
    );
  }
}
