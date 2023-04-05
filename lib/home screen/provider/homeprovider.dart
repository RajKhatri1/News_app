import 'package:api_map/utils/apihelper.dart';
import 'package:flutter/material.dart';

import '../model/modelpage.dart';

class Homeprovider extends ChangeNotifier {
  apihelper Apihelper = apihelper();
  HomeModel? homeModel;

  Future<void> newsApiCall() async {
    HomeModel h1 = await Apihelper.newsapi();

    homeModel = h1;
    notifyListeners();
  }
}
