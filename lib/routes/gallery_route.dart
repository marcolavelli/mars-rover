import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mars_rover/models/latest_photo.dart';
import 'package:mars_rover/routes/info_route.dart';
import 'package:mars_rover/routes/loading_route.dart';
import 'package:mars_rover/routes/photo_route.dart';

class CameraRoute extends StatefulWidget {
  final List<LatestPhoto> items;

  CameraRoute(this.items);

  @override
  _CameraRouteState createState() => _CameraRouteState();
}

class _CameraRouteState extends State<CameraRoute> {
  int _selectedIndex = 0;
  List<LatestPhoto> _selectedItems = [];
  String _selectedCamera = '';

  @override
  void initState() {
    updateUI();
    super.initState();
  }

  void updateUI() {
    setState(() {
      switch (_selectedIndex) {
        case 0:
          _selectedCamera = 'NAVCAM';
          break;
        case 1:
          _selectedCamera = 'MCZ';
          break;
        case 2:
          _selectedCamera = 'HAZCAM';
          break;
        case 3:
          _selectedCamera = 'SUPERCAM_RMI';
          break;
        case 4:
          _selectedCamera = 'SKYCAM';
          break;
        default:
          _selectedCamera = '';
      }

      _selectedCamera == ''
          ? _selectedItems = [...widget.items]
          : _selectedItems = [
              ...widget.items
                  .where((element) => element.camera.contains(_selectedCamera))
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
        title: Text('Gallery: $_selectedCamera'),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoadingRoute(),
                )),
            icon: Icon(Icons.update),
          ),
        ],
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
      body: _selectedItems.length > 0
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
                        latestPhoto: _selectedItems[index],
                        photo: NetworkImage(_selectedItems[index].image),
                      ),
                    ),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: _selectedItems[index].image,
                    placeholder: (context, url) => SpinKitPulse(
                      color: Colors.white,
                      size: 30.0,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              itemCount: _selectedItems.length,
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
            icon: Icon(Icons.control_camera_sharp),
            label: 'Navcam',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_camera_back),
            label: 'Mastcam',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_outlined),
            label: 'Hazcam',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_rounded),
            label: 'Supercam',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flip_camera_android_rounded),
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
