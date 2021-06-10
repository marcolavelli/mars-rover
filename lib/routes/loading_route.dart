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

    print('navcams: $navcams');
    print('mastcams: $mastcams');
    print('hazcams: $hazcams');
    print('skycam: $skycam');
    lenOfLatestPhoto == (navcams + mastcams + hazcams + skycam)
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              'assets/images/loading.png',
              width: 110.0,
            ),
          ),
          SpinKitWave(
            color: Colors.white,
            size: 60.0,
          ),

        ],
      ),
    );
  }
}
