import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'MainGame.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainGame(),
      
    );
  }
}