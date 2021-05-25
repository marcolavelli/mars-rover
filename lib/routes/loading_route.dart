import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mars_rover/routes/rover_route.dart';
import 'package:mars_rover/services/apikey.dart';
import 'package:mars_rover/services/networking.dart';

class LoadingRoute extends StatefulWidget {
  @override
  _LoadingRouteState createState() => _LoadingRouteState();
}

class _LoadingRouteState extends State<LoadingRoute> {
  @override
  void initState() {
    getRoverData();
    super.initState();
  }

  void getRoverData() async {
    NetworkHelper helper = NetworkHelper('https://api.nasa.gov/mars-photos/api/'
        'v1/rovers/perseverance/latest_photos?api_key=$APIKEY');
    var roverData = await helper.getData();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RoverRoute(roverData),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SpinKitFadingCube(
        color: Colors.white,
        size: 30.0,
      )),
    );
  }
}
