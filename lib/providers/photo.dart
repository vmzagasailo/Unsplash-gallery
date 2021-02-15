import 'package:flutter/foundation.dart';

class Photo with ChangeNotifier{
  final String id;
  final String imageUrl;
  final String namePhoto;
  final String nameAuthor;

  Photo({
    @required this.id,
    @required this.imageUrl,
    @required this.namePhoto,
    @required this.nameAuthor,
  });
}
