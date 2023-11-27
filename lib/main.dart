import 'package:dino_run/MainMenu2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'home.dart';
import 'MainMenu2.dart';
import 'palette.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'dino_run',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainMenu2(),
      
    );
  }
}