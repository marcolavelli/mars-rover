import 'package:flutter/material.dart';
import 'package:mars_rover/models/latest_photo.dart';
import 'package:photo_view/photo_view.dart';

class PhotoRoute extends StatelessWidget {
  final LatestPhoto latestPhoto;

  PhotoRoute(this.latestPhoto);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PhotoView(
          imageProvider: NetworkImage(
            latestPhoto.image,
          ),
        ),
      ),
    );
  }
}
