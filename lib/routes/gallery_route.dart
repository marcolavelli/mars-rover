import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mars_rover/models/latest_photo.dart';
import 'package:mars_rover/routes/info_route.dart';
import 'package:mars_rover/routes/photo_route.dart';

class CameraRoute extends StatefulWidget {
  final List<LatestPhoto> items;

  CameraRoute(this.items);

  @override
  _CameraRouteState createState() => _CameraRouteState();
}

class _CameraRouteState extends State<CameraRoute> {
  int _selectedIndex = 0;
  List<LatestPhoto> selectedItems = [];

  @override
  void initState() {
    updateUI();
    super.initState();
  }

  void updateUI() {
    String selectedCamera;
    switch (_selectedIndex) {
      case 0:
        selectedCamera = '';
        break;
      case 1:
        selectedCamera = 'NAVCAM';
        break;
      case 2:
        selectedCamera = 'MCZ';
        break;
      case 3:
        selectedCamera = 'HAZCAM';
        break;
      case 4:
        selectedCamera = 'SKYCAM';
        break;
      default:
        selectedCamera = '';
    }
    setState(() {
      selectedCamera == ''
          ? selectedItems = [...widget.items]
          : selectedItems = [
              ...widget.items
                  .where((element) => element.camera.contains(selectedCamera))
            ];
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    updateUI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => InfoRoute(),
          ),
        ),
        child: Icon(Icons.precision_manufacturing),
        backgroundColor: Colors.amberAccent,
      ),
      body: selectedItems.length > 0
          ? GridView.builder(
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
                        latestPhoto: selectedItems[index],
                        photo: NetworkImage(selectedItems[index].image),
                      ),
                    ),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: selectedItems[index].image,
                    placeholder: (context, url) => SpinKitPulse(
                      color: Colors.white,
                      size: 30.0,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              itemCount: selectedItems.length,
            )
          : Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset(
                      'assets/images/loading.png',
                      width: 120.0,
                    ),
                  ),
                  Text('No latest photos available'),
                ],
              ),
            ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: 'All cams',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.control_camera_sharp),
            label: 'Navcams',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_rounded),
            label: 'Mastcams',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_outlined),
            label: 'Hazcams',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.catching_pokemon),
            label: 'Skycam',
          ),
        ],
        currentIndex: _selectedIndex,
        showUnselectedLabels: true,
        selectedItemColor: Colors.amberAccent,
        unselectedItemColor: Colors.white70,
        onTap: _onItemTapped,
      ),
    );
  }
}
