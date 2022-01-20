import 'package:flutter/material.dart';
import 'package:post_data_to_internet/screen/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Json Get Example",
      theme: ThemeData(
        primarySwatch: Colors.purple
      ),
      home: const MyHomePage(title: 'Flutter APi'),
    );
  }
}
