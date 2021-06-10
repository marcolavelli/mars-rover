import 'dart:io';

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

  void _savePhoto() async {

    // TODO: https://pub.dev/documentation/image_picker/latest/
    // final _picker = ImagePicker();
    //
    // // Step 1: Retrieve image from picker
    // PickedFile? image = await _picker.getImage(source: ImageSource.camera);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sol - Mars day: ',
                  style: TextStyle(fontSize: 12.0),
                ),
                Text(
                  'Earth date: ',
                  style: TextStyle(fontSize: 12.0),
                ),
                Text(
                  'Rover Camera: ',
                  style: TextStyle(fontSize: 12.0),
                ),
              ],
            ),
            SizedBox(width: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${latestPhoto.sol.toString()}',
                  style: TextStyle(fontSize: 12.0),
                ),
                Text(
                  '${latestPhoto.earthDate}',
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
      floatingActionButton: FloatingActionButton(
        onPressed: _savePhoto,
        child: Icon(Icons.file_download),
        backgroundColor: Colors.amberAccent,
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
