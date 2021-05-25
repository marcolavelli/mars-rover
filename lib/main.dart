import 'package:flutter/material.dart';
import 'package:mars_rover/routes/loading_route.dart';
import 'package:mars_rover/routes/rover_route.dart';

void main() => runApp(MarsRoverApp());

class MarsRoverApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: LoadingRoute(),
    );
  }
}
