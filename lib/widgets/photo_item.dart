import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/photo.dart';

import '../screen/photo_detail_screen.dart';

class PhotoItem extends StatelessWidget {
  bool progressIndicator = false;
  @override
  Widget build(BuildContext context) {
    final photo = Provider.of<Photo>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed(PhotoDetailScreen.routeName, arguments: photo.id);
          },
          child: Image.network(
            photo.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          leading: Text(
            photo.namePhoto,
            style: TextStyle(color: Colors.white),
          ),
          trailing: Text(
            photo.nameAuthor,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          title: Text(''),
        ),
      ),
    );
  }
}
