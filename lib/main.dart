import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'RemoteControl.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Remote Control',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RemoteControlPage(),
    );
  }
}
