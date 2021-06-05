import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mars_rover/models/latest_photo.dart';
import 'package:mars_rover/routes/photo_route.dart';

class CameraRoute extends StatefulWidget {
  final List<LatestPhoto> items;

  CameraRoute(this.items);

  @override
  _CameraRouteState createState() => _CameraRouteState();
}

class _CameraRouteState extends State<CameraRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
          crossAxisSpacing: 2.0,
          mainAxisSpacing: 2.0,
        ),
        itemBuilder: (context, index) => GridTile(
          child: GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PhotoRoute(
                  latestPhoto:widget.items[index],
                  photo: NetworkImage(widget.items[index].image),
                ),
              ),
            ),
            child: CachedNetworkImage(
              imageUrl: widget.items[index].image,
              placeholder: (context, url) => SpinKitPulse(
                color: Colors.white,
                size: 30.0,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        itemCount: widget.items.length,
      ),
    );
  }
}

// ElevatedButton(
// onPressed: () => Navigator.pop(context),
// child: Text('Behind'),
// ),
