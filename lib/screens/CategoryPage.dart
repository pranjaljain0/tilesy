import 'package:cache_image/cache_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tilesy/Constants.dart';
import 'package:tilesy/Variables.dart';
import 'package:tilesy/data_operations/fetch.dart';
import 'package:intl/intl.dart';
import 'package:tilesy/screens/FullImage.dart';

Map categoryInfo;

class CategoryPage extends StatefulWidget {
  CategoryPage(Map catInfo) {
    categoryInfo = catInfo;
  }
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  int _selector = 0;

  List<Widget> loader = [ScreenLoader(), Main()];

  initializeData(String catName) async {
    Fetch fetch = Fetch();
    print('loading');
    await fetch.categoryData(catName);
    setState(() {
      _selector = 1;
    });
  }

  @override
  void initState() {
    super.initState();
    initializeData(categoryInfo['Name']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => <Widget>[
                SliverAppBar(
                    expandedHeight: 200.0,
                    floating: true,
                    pinned: true,
                    backgroundColor: secondaryColor,
                    flexibleSpace: Stack(
                      children: <Widget>[
                        Positioned.fill(
                            child: Image(
                          image: CacheImage(categoryInfo['url']),
                          fit: BoxFit.cover,
                        )),
                        FlexibleSpaceBar(
                          centerTitle: true,
                          title: Text(
                              toBeginningOfSentenceCase(categoryInfo['Name']),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40.0,
                                fontFamily: 'Maquire',
                              )),
                        ),
                      ],
                    ))
              ],
          body: loader[_selector]),
    );
  }
}

class ScreenLoader extends StatefulWidget {
  @override
  _ScreenLoaderState createState() => _ScreenLoaderState();
}

class _ScreenLoaderState extends State<ScreenLoader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SpinKitFadingCube(
        color: Colors.white,
        size: 50.0,
      ),
    );
  }
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  Widget imageObj(Map imageData) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FullImage(imageData))),
              child: Container(
                margin: EdgeInsets.all(5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(11.0),
                  child: Hero(
                    tag: imageData,
                    child: Image(
                      width: MediaQuery.of(context).size.width,
                      image: CacheImage(imageData['src']['portrait']),
                      fit: BoxFit.cover,
                    ),
                    // child: Image.network(
                    //   imageData['src']['portrait'],
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                ),
              ),
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Row(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.all(2),
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 20,
                      )),
                  Text(
                    imageData['photographer'],
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
        childAspectRatio: 0.7,
        children: List.generate(categoryPhotos['photos'].length,
            (i) => imageObj(categoryPhotos['photos'][i])),
      ),
    );
  }
}
