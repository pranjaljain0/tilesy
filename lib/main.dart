import 'package:flutter/material.dart';
import 'package:tilesy/data_operations/loading.dart';
import 'package:tilesy/screens/home.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/':(context)=>Loading(),
      '/home':(context)=>Home(),
    }, 
  ));
}