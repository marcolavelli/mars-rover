import 'package:flutter/material.dart';
import 'package:mars_rover/models/latest_photo.dart';
import 'package:mars_rover/routes/photo_route.dart';

class CameraRoute extends StatelessWidget {
  final List<LatestPhoto> items;

  CameraRoute(this.items);

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
                builder: (context) => PhotoRoute(items[index]),
              ),
            ),
            child: Image(
              image: NetworkImage(
                items[index].image,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        itemCount: items.length,
      ),
    );
  }
}

// ElevatedButton(
// onPressed: () => Navigator.pop(context),
// child: Text('Behind'),
// ),
