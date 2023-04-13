import 'package:flutter/material.dart';

import 'RemoteControl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Remote Control',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RemoteControl(),
    );
  }
}
