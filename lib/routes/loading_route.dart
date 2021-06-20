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
  var _test = '';

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

    listOfLatestPhoto.forEach((element) {
      print(element.camera);
    });

    var navcams = listOfLatestPhoto
        .where((element) => element.camera.contains('NAVCAM'))
        .length;
    var mastcams = listOfLatestPhoto
        .where((element) => element.camera.contains('MCZ'))
        .length;
    var hazcams = listOfLatestPhoto
        .where((element) => element.camera.contains('HAZCAM'))
        .length;
    var skycam = listOfLatestPhoto
        .where((element) => element.camera.contains('SKYCAM'))
        .length;
    var supercam = listOfLatestPhoto
        .where((element) => element.camera.contains('SUPERCAM_RMI'))
        .length;

    print('navcams: $navcams');
    print('mastcams: $mastcams');
    print('hazcams: $hazcams');
    print('skycam: $supercam');
    print('skycam: $skycam');

    setState(() {
      lenOfLatestPhoto == (navcams + mastcams + hazcams + supercam + skycam)
          ? _test = 'test result ... $lenOfLatestPhoto OK'
          : _test = 'test result ... $lenOfLatestPhoto FAILED';
    });

    print(_test);

    /// END TEST

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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              'assets/images/loading.png',
              width: 120.0,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Download the latest photos'),
              SpinKitThreeBounce(
                color: Colors.white,
                size: 15.0,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(_test),
          ),
        ],
      ),
    );
  }
}
