import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InfoRoute extends StatefulWidget {
  @override
  _InfoRouteState createState() => _InfoRouteState();
}

class _InfoRouteState extends State<InfoRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Information',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/images/rover.png',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
