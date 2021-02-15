import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/photos_providers.dart';

import './screen/photo_overwiev_screen.dart';
import './screen/photo_detail_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: PhotosProviders(),
      child: MaterialApp(
          title: 'MyShop',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato',
          ),
          home: PhotoOverviewScreen(),
          routes: {
            PhotoDetailScreen.routeName: (ctx) => PhotoDetailScreen(),
          }),
    );
  }
}
