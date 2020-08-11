import 'package:flutter/material.dart';
import 'package:tilesy/Constants.dart';

class AboutTab extends StatefulWidget {
  @override
  _AboutTabState createState() => _AboutTabState();
}

class _AboutTabState extends State<AboutTab> {
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
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text("About",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40.0,
                          fontFamily: 'Maquire',
                        )),
                  ),
                )
              ],
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      'An application by',
                      style: TextStyle(
                        color: secondaryTextColor,
                        fontSize: 20,
                        fontFamily: 'ProductSans',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      'BIONIX Inc.',
                      style: TextStyle(
                          fontFamily: 'ProductSans',
                          fontSize: 30,
                          color: Color(0xffffffff)),
                    ),
                  ),
                ],
              ),
              Text(
                'Version 1.0',
                style: TextStyle(
                  color: secondaryTextColor,
                  fontSize: 15,
                  fontFamily: 'ProductSans',
                ),
              ),
            ],
          )),
    );
  }
}
