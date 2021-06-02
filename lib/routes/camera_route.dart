import 'package:flutter/material.dart';
import 'package:mars_rover/models/latest_photo.dart';

class CameraRoute extends StatelessWidget {
  final List<LatestPhoto> items;

  CameraRoute(this.items);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Behind'),
            ),
          ],
        ),
      ),
    );
  }
}
