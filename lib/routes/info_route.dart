import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InfoRoute extends StatefulWidget {
  @override
  _InfoRouteState createState() => _InfoRouteState();
}

class _InfoRouteState extends State<InfoRoute> {
  final List<String> cameras = [
    'NAVCAM',
    'MCZ',
    'HAZCAM',
    'SUPERCAM_RMI',
    'SKYCAM',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Information',
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/images/rover.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Image.asset(
      //           'assets/images/rover.png',
      //           fit: BoxFit.cover,
      //         ),
      //       ),
      //       ...cameras.map(
      //         (e) => Text(e),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
