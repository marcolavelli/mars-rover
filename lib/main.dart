import 'package:flutter/material.dart';
import 'package:mars_rover/models/cameras_rover.dart';
import 'package:mars_rover/routes/loading_route.dart';
import 'package:provider/provider.dart';

void main() => runApp(MarsRoverApp());

class MarsRoverApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CamerasRover(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: LoadingRoute(),
      ),
    );
  }
}
