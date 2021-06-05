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
        title: Text(
          'SOL: ${latestPhoto.sol.toString()}\n'
          'EARTH DATE: ${latestPhoto.earthDate}\n'
          'CAMERA: ${latestPhoto.cameraFullName}',
          style: TextStyle(
            fontSize: 12.0,
          ),
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
