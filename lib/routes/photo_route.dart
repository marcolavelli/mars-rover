import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mars_rover/models/latest_photo.dart';
import 'package:photo_view/photo_view.dart';

class PhotoRoute extends StatelessWidget {
  final LatestPhoto latestPhoto;
  final ImageProvider photo;

  PhotoRoute({
    required this.latestPhoto,
    required this.photo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Sol: ',
                  style: TextStyle(fontSize: 12.0),
                ),
                Text(
                  '${latestPhoto.sol.toString()}',
                  style: TextStyle(fontSize: 12.0),
                ),
                SizedBox(width: 20.0),
                Text(
                  'Earth: ',
                  style: TextStyle(fontSize: 12.0),
                ),
                Text(
                  '${latestPhoto.earthDate}',
                  style: TextStyle(fontSize: 12.0),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Rover Cam: ',
                  style: TextStyle(fontSize: 12.0),
                ),
                Text(
                  '${latestPhoto.cameraFullName}',
                  style: TextStyle(fontSize: 12.0),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Center(
        child: PhotoView(
          imageProvider: photo,
          loadingBuilder: (context, url) => SpinKitPulse(
            color: Colors.white,
            size: 60.0,
          ),
        ),
      ),
    );
  }
}
