import 'package:flutter/material.dart';
import 'package:flutter_cupertino/MainPage.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cupertino',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AddEntryDialog(),
      //MainPage(),
    );
  }
}