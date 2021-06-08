import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mars_rover/models/latest_photo.dart';
import 'package:mars_rover/services/apikey.dart';
import 'package:mars_rover/services/networking.dart';

import 'gallery_route.dart';

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

    /// TEST
    var navcams = listOfLatestPhoto
        .where((element) => element.camera.contains('NAVCAM'))
        .length;
    var mastcams = listOfLatestPhoto
        .where((element) => element.camera.contains('MCZ'))
        .length;
    var hazcams = listOfLatestPhoto
        .where((element) => element.camera.contains('HAZCAM'))
        .length;

    print('navcams: $navcams');
    print('mastcams: $mastcams');
    print('hazcams: $hazcams');
    lenOfLatestPhoto == (navcams + mastcams + hazcams)
        ? print('test result... $lenOfLatestPhoto OK')
        : print('test result...  $lenOfLatestPhoto FAILED');

    /// TEST (END)

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Perseverance\nMars',
            style: TextStyle(fontSize: 24.0),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 50.0),
          Text('Loading Rover Data...'),
          SizedBox(height: 10.0),
          SpinKitWave(
            color: Colors.white,
            size: 30.0,
          ),
        ],
      ),
    );
  }
}
