import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import './photo.dart';

class PhotosProviders with ChangeNotifier {
  List<Photo> _items = [];

  List<Photo> get items {
    return [..._items];
  }

  Photo findByid(String id) {
    return _items.firstWhere((photo) => photo.id == id);
  }

  Future<void> fetchData() async {
    const url =
        'https://api.unsplash.com/photos/?client_id=ab3411e4ac868c2646c0ed488dfd919ef612b04c264f3374c97fff98ed253dc9';

    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as List<dynamic>;
      final List<Photo> loadedPhoto = [];

      extractedData.forEach((photo) {
        loadedPhoto.add(Photo(
          id: photo['id'],
          namePhoto: photo['user']['name'],
          nameAuthor: photo['user']['username'],
          imageUrl: photo['urls']['regular'],
        ));
      });
      _items = loadedPhoto;
      notifyListeners();
      //print(json.decode(response.body));
    } catch (error) {
      throw (error);
    }
  }
}
