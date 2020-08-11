import 'dart:convert';
import 'package:http/http.dart';
import 'package:tilesy/Variables.dart';

class Fetch {
  String key = "563492ad6f91700001000001a2aeb39bfff64246a9fd2d802188d68e";
  String initialURL = "https://dygon.herokuapp.com/pexel/curated";
  String categoryURL = "https://dygon.herokuapp.com/pexel/categories/";
  Future<bool> initialData() async {
    var url = initialURL;
    Response response = await get(url);
    initialArray = jsonDecode(response.body);
    return true;
  }

  Future<bool> categoryData(String categoryName) async {
    var url = categoryURL + categoryName.replaceAll(new RegExp(r"\s+\b|\b\s"), "");
    Response response = await get(url);
    categoryPhotos=jsonDecode(response.body);
    return true;
  }
}
