import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class LatestPhoto {
  final int sol;
  final String camera;
  final String cameraFullName;
  final String image;
  final String earthDate;

  LatestPhoto({
    required this.sol,
    required this.camera,
    required this.cameraFullName,
    required this.image,
    required this.earthDate,
  });

  factory LatestPhoto.fromJson(Map<String, dynamic> json, int index) {
    return LatestPhoto(
      sol: json['latest_photos'][index]['sol'],
      camera: json['latest_photos'][index]['camera']['name'],
      cameraFullName: json['latest_photos'][index]['camera']['full_name'],
      image: json['latest_photos'][index]['img_src'],
      earthDate: json['latest_photos'][index]['earth_date'],
    );
  }
}
