import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mars_rover/models/latest_photo.dart';

import 'camera_route.dart';

class RoverRoute extends StatefulWidget {
  final perseveranceData;

  RoverRoute(this.perseveranceData);

  @override
  _RoverRouteState createState() => _RoverRouteState();
}

class _RoverRouteState extends State<RoverRoute> {

  List<LatestPhoto> items = [];

  @override
  void initState() {
    updateUI(widget.perseveranceData);
    super.initState();
  }

  void updateUI(dynamic roverData) {
    int lenOfLatestPhoto = (roverData['latest_photos'] as List<dynamic>).length;

    items = List.generate(
      lenOfLatestPhoto,
      (index) => LatestPhoto.fromJson(roverData, index),
    );

    items.forEach((element) {
      print(element.sol);
      print(element.camera);
      print(element.cameraFullName);
      print(element.image);
      print(element.earthDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Perseverance',
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CameraRoute(items),
                ),
              ),
              child: CircleAvatar(
                child: Icon(
                  Icons.camera,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
