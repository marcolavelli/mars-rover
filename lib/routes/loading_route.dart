import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mars_rover/models/latest_photo.dart';
import 'package:mars_rover/services/apikey.dart';
import 'package:mars_rover/services/networking.dart';

import 'camera_route.dart';

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

    int lenOfLatestPhoto = (roverData['latest_photos'] as List<dynamic>).length;
    var listOfLatestPhoto = List.generate(
      lenOfLatestPhoto,
      (index) => LatestPhoto.fromJson(roverData, index),
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => CameraRoute(listOfLatestPhoto),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 30.0,
        ),
      ),
    );
  }
}
