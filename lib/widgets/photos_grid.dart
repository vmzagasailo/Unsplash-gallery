import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/photos_providers.dart';

import '../widgets/photo_item.dart';





class PhotosGrid extends StatelessWidget {
@override
  Widget build(BuildContext context) {
    final photosData = Provider.of<PhotosProviders>(context);
    final photos = photosData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: photos.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
            value: photos[i],
            child: PhotoItem(),
          ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 1,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}