import 'package:flutter/material.dart';

import 'screen/HomeScreen.dart';

void main() {
  runApp(MaterialApp(
    title: "dduR BuildSystem",
    theme: ThemeData(
      primaryColor: Colors.blue,
      useMaterial3: true,
    ),
    home: HomeScreen(),
  ));
}
