import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tilesy/Constants.dart';
import 'package:wallpaper_manager/wallpaper_manager.dart';

Map singleImageData;

class FullImage extends StatefulWidget {
  FullImage(Map imageData) {
    singleImageData = imageData;
  }

  @override
  _FullImageState createState() => _FullImageState();
}

class _FullImageState extends State<FullImage> {
  String result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: secondaryColor,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Hero(
            tag: singleImageData,
            child: Image.network(
              singleImageData['src']['portrait'],
              fit: BoxFit.cover,
            ),
          ),
        ),
        floatingActionButton: FabCircularMenu(
            alignment: Alignment.bottomCenter,
            ringColor: secondaryColor,
            ringWidth: 50,
            ringDiameter: 250,
            fabColor: Colors.white,
            fabCloseColor: secondaryColor,
            fabElevation: 11,
            animationDuration: Duration(milliseconds: 500),
            animationCurve: Curves.easeInOutBack,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                onPressed: () async {
                  print('yooy');
                  int location = WallpaperManager
                      .HOME_SCREEN; // or location = WallpaperManager.LOCK_SCREEN;
                  var file = await DefaultCacheManager()
                      .getSingleFile(singleImageData['src']['portrait']);
                  result = await WallpaperManager.setWallpaperFromFile(
                      file.path, location);
                  _showToast(context, 'Home screen wallpaper applied');
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                onPressed: () async {
                  print('yooy');
                  int location = WallpaperManager
                      .LOCK_SCREEN; // or location = WallpaperManager.LOCK_SCREEN;
                  var file = await DefaultCacheManager()
                      .getSingleFile(singleImageData['src']['portrait']);
                  result = await WallpaperManager.setWallpaperFromFile(
                      file.path, location);
                  _showToast(context, 'Lock screen wallpaper applied');
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.stay_current_portrait,
                  color: Colors.white,
                ),
                onPressed: () async {
                  print('yooy');
                  int location = WallpaperManager
                      .HOME_SCREEN; // or location = WallpaperManager.LOCK_SCREEN;
                  int location1 = WallpaperManager
                      .LOCK_SCREEN; // or location = WallpaperManager.LOCK_SCREEN;
                  var file = await DefaultCacheManager()
                      .getSingleFile(singleImageData['src']['portrait']);
                  result = await WallpaperManager.setWallpaperFromFile(
                      file.path, location);
                  result = await WallpaperManager.setWallpaperFromFile(
                      file.path, location1);
                  _showToast(context, 'Wallpaper applied');
                },
              ),
            ]));
  }

  void _showToast(BuildContext context, String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}
