import 'dart:convert';
import 'dart:math';

import 'package:api_map/home%20screen/model/modelpage.dart';
import 'package:http/http.dart' as http;

class apihelper {
  Future<HomeModel> newsapi() async {
    String applink =
        "https://newsapi.org/v2/everything?q=tesla&from=2023-03-05&sortBy=publishedAt&apiKey=421bf1b94b28421cbaeb97808a515ae8";
    Uri uri = Uri.parse(applink);
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    HomeModel h1 = HomeModel();
    HomeModel homeModel = h1.NewsFromJson(json);
    return homeModel;

  }
}
