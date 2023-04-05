import 'package:api_map/detailpage.dart';
import 'package:api_map/home%20screen/provider/homeprovider.dart';
import 'package:api_map/home%20screen/view/HomePage.dart';
import 'package:api_map/tabbarpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Homeprovider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/' : (context) => Tabbar_screen(),
          'detail' : (context) => Detail_screen(),
          'home' : (context) => Home_screen(),
        },
      ),
    ),
  );
}
