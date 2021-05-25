import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RoverRoute extends StatefulWidget {
  final perseveranceData;

  RoverRoute(this.perseveranceData);

  @override
  _RoverRouteState createState() => _RoverRouteState();
}

class _RoverRouteState extends State<RoverRoute> {
  var allJsonDataTest;
  var earthDate;

  @override
  void initState() {
    updateUI(widget.perseveranceData);
    super.initState();
  }

  void updateUI(dynamic roverData) {
    allJsonDataTest = roverData.toString();
    earthDate = roverData['latest_photos'][0]['earth_date']; // 2021-05-23

    // {
    // "id": 839134,
    // "sol": 92,
    // "camera": {
    // "id": 38,
    // "name": "NAVCAM_LEFT",
    // "rover_id": 8,
    // "full_name": "Navigation Camera - Left"
    // },
    // "img_src": "https://mars.nasa.gov/mars2020-raw-images/pub/ods/surface/sol/00092/ids/edr/browse/ncam/NLF_0092_0675110347_487ECM_N0040136NCAM00507_01_295J01_1200.jpg",
    // "earth_date": "2021-05-23",
    // "rover": {
    // "id": 8,
    // "name": "Perseverance",
    // "landing_date": "2021-02-18",
    // "launch_date": "2020-07-30",
    // "status": "active"
    // }
    // },
    // TOTALE 124!
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Perseverance',
            ),
            Text(
              earthDate,
            ),
          ],
        ),
      ),
    );
  }
}
