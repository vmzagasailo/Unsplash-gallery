import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/photos_providers.dart';

class PhotoDetailScreen extends StatelessWidget {
  static const routeName = 'photos';
  @override
  Widget build(BuildContext context) {
    final photoId = ModalRoute.of(context).settings.arguments as String;
    final loadedPhoto =
        Provider.of<PhotosProviders>(context, listen: false).findByid(photoId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedPhoto.namePhoto),
      ),
      body: GridTile(
        child: Container(
          height: MediaQuery.of(context).size.height * 1,
          
                      child: Image.network(
              loadedPhoto.imageUrl,
              fit: BoxFit.cover,
            ),
          
        ),
        footer: GridTileBar(title: Text(loadedPhoto.nameAuthor,textAlign: TextAlign.end,),),
      ),
    );
  }
}
