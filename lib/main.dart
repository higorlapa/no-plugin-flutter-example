import 'package:flutter/material.dart';
import 'package:flutter_app_no_plugin/pages/counter_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.yellow,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            foregroundColor: Colors.black, backgroundColor: Colors.yellow),
      ),
      debugShowCheckedModeBanner: false,
      home: CounterPage(),
    );
  }
}
