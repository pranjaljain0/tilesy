import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tilesy/Constants.dart';
import 'package:tilesy/Variables.dart';
import 'package:tilesy/data_operations/fetch.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getData() async{
    Fetch fetch=Fetch();
    Map catList=jsonDecode(initialCat);
    
    await fetch.initialData();
    catList['Categories'].forEach((item)=>fetch.categoryData(item['Name']));
    // await fetch.getCategoryHead();
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
              margin: EdgeInsets.symmetric(vertical: 80),
              child: Text(
                'TILESY',
                style: TextStyle(
                    color: secondaryColor, fontSize: 80, fontFamily: 'Maquire'),
              )),
          SpinKitFadingCube(
            color: Colors.white,
            size: 50.0,
          ),
        ],
      ),
    );
  }
}
