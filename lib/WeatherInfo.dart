import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'models.dart';
import 'modelspostall.dart';

class WeatherInfo with ChangeNotifier {
  String _tempType = "celcius";
  int _temperatureVal = 25;
  String _title = "";
  List<PostAll> _postAll;

  int get temperatureVal => _temperatureVal;
  String get temperatureType => _tempType;
  String get title => _title;
  List<PostAll> get postalltitle => _postAll;

  set temperature(int newTemp) {
    _temperatureVal = newTemp;
    notifyListeners();
  }

  set temperatureType(String newType) {
    _tempType = newType;
    notifyListeners();
  }

  titlefunction() async {
    final Post fetchedPost = await fetchPost();
    _title = fetchedPost.title;
    notifyListeners();
  }

  listfunction() async {
    final List<PostAll> fetchedPost = await fetchPostall();
    _postAll = fetchedPost;
    notifyListeners();
  }

  Future<Post> fetchPost() async {
    final response =
        await http.get('https://jsonplaceholder.typicode.com/posts/1');

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return Post.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<List<PostAll>> fetchPostall() async {
    final response =
        await http.get('https://jsonplaceholder.typicode.com/posts/');

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return compute(postAllFromJson, response.body);
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
