import 'package:flutter/material.dart';
import 'package:tilesy/Constants.dart';
import 'package:tilesy/Variables.dart';
import 'package:tilesy/screens/FullImage.dart';
import 'package:cache_image/cache_image.dart';
import 'package:tilesy/data_operations/Services.dart';
import 'package:firebase_admob/firebase_admob.dart';

const String testDevice = "137901B2079518A43BB438E1281D36BD";

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final ams = AdMobService();
  bool showInterstitial = false;
  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    keywords: <String>[],
    contentUrl: 'https://flutter.io',
    nonPersonalizedAds: false,
    childDirected: false,
    testDevices: testDevice != null ? <String>[testDevice] : null,
    // testDevices: <String>[], // Android emulators are considered test devices
  );

  BannerAd myBanner = BannerAd(
    adUnitId: 'ca-app-pub-7854932035593391/5026880333',
    size: AdSize.banner,
    targetingInfo: targetingInfo,
    listener: (MobileAdEvent event) {
      print("BannerAd event is $event");
    },
  );

  InterstitialAd myInterstitial() {
    return InterstitialAd(
      adUnitId: 'ca-app-pub-7854932035593391/6916415186',
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("InterstitialAd event is $event");
      },
    );
  }

  @override
  void initState() {
    FirebaseAdMob.instance
        .initialize(appId: 'ca-app-pub-7854932035593391~7844615364');
    super.initState();
    myBanner
      ..load()
      ..show(
        anchorOffset: 100.0,
        horizontalCenterOffset: 0.0,
        anchorType: AnchorType.bottom,
      );
  }

  @override
  void dispose() {
    myBanner.dispose();
    super.dispose();
  }

  Widget imageObj(Map imageData) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onTap: () {
                myInterstitial()
                  ..load()
                  ..show(
                    anchorType: AnchorType.bottom,
                    anchorOffset: 0.0,
                    horizontalCenterOffset: 0.0,
                  );
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FullImage(imageData)));
                myBanner.dispose();
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(11.0),
                child: Hero(
                  tag: imageData,
                  child: Image(
                    image: CacheImage(imageData['src']['portrait']),
                    fit: BoxFit.cover,
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
    // print(initialArray['photos'].length);
    return Scaffold(
        backgroundColor: backgroundColor,
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: 200.0,
                  floating: true,
                  pinned: true,
                  backgroundColor: secondaryColor,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text("TILESY",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40.0,
                          fontFamily: 'Maquire',
                        )),
                  ),
                )
              ];
            },
            body: Column(
              children: <Widget>[
                Expanded(
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 0,
                    childAspectRatio: 0.7,
                    children: List.generate(initialArray['photos'].length,
                        (i) => imageObj(initialArray['photos'][i])),
                  ),
                ),
              ],
            )));
  }
}
