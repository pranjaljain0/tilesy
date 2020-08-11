import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tilesy/Constants.dart';
import 'package:tilesy/Variables.dart';
import 'package:cache_image/cache_image.dart';
import 'package:intl/intl.dart';
import 'package:tilesy/screens/CategoryPage.dart';
import 'package:tilesy/data_operations/Services.dart';
import 'package:firebase_admob/firebase_admob.dart';

const String testDevice = "137901B2079518A43BB438E1281D36BD";

class CatTab extends StatefulWidget {
  @override
  _CatTabState createState() => _CatTabState();
}

class _CatTabState extends State<CatTab> {
  final ams = AdMobService();

  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    keywords: <String>[],
    contentUrl: 'https://flutter.io',
    nonPersonalizedAds: false,
    childDirected: false,
    testDevices: testDevice != null ? <String>[testDevice] : null,
    // testDevices: <String>[], // Android emulators are considered test devices
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
    super.initState();
    FirebaseAdMob.instance.initialize(appId: ams.getAdMobAdID());
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget item(Map catObj) {
    return GestureDetector(
      onTap: () {
        myInterstitial()
          ..load()
          ..show(
            anchorType: AnchorType.bottom,
            anchorOffset: 0.0,
            horizontalCenterOffset: 0.0,
          );
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CategoryPage(catObj)));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        child: Stack(children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              color: Colors.transparent,
              image: DecorationImage(
                  fit: BoxFit.cover, image: CacheImage(catObj['url'])),
            ),
            height: 200.0,
          ),
          Container(
            height: 200.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                color: Colors.white,
                gradient: LinearGradient(
                  end: Alignment.bottomLeft,
                  begin: Alignment.topRight,
                  colors: [
                    Colors.grey.withOpacity(0.0),
                    Colors.black.withOpacity(0.9),
                  ],
                )),
          ),
          Positioned.fill(
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Text(
                      toBeginningOfSentenceCase(catObj['Name']),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontFamily: 'ProductSans'),
                    ),
                  ))),
        ]),
      ),
    );
  }

  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  @override
  Widget build(BuildContext context) {
    Map cat = jsonDecode(initialCat);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => <Widget>[
                SliverAppBar(
                  expandedHeight: 200.0,
                  floating: true,
                  pinned: true,
                  backgroundColor: secondaryColor,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text("Categories",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40.0,
                          fontFamily: 'Maquire',
                        )),
                  ),
                )
              ],
          body: Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                    shrinkWrap: true,
                    children: List.generate(cat['Categories'].length,
                        (index) => item(cat['Categories'][index]))
                    // children: <Widget>[item()],
                    ),
              ),
            ],
          )),
    );
  }
}
