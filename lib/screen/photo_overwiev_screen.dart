import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/photos_providers.dart';

import '../widgets/photos_grid.dart';
import '../widgets/drawer.dart';


class PhotoOverviewScreen extends StatefulWidget {
  @override
  _PhotoOverviewScreenState createState() => _PhotoOverviewScreenState();
}

class _PhotoOverviewScreenState extends State<PhotoOverviewScreen> {
  static const routeName = 'photoss';
  var _isInit = true;
  var _isLoading = false;
  @override
  void didChangeDependencies() {
    if(_isInit) { 
      setState(() {
        _isLoading = true;
      });
      Provider.of<PhotosProviders>(context).fetchData().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyGalery'),
        
      ),
      drawer: AppDrawer(),
      body:_isLoading ? Center(child: CircularProgressIndicator(),): PhotosGrid(),
    );
  }
}


