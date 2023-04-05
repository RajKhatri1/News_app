import 'package:api_map/home%20screen/view/HomePage.dart';
import 'package:flutter/material.dart';

class Tabbar_screen extends StatefulWidget {
  const Tabbar_screen({Key? key}) : super(key: key);

  @override
  State<Tabbar_screen> createState() => _Tabbar_screenState();
}

class _Tabbar_screenState extends State<Tabbar_screen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
animationDuration: Duration(seconds: 2),
      length: 3,
      child: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text("News",style: TextStyle(color: Colors.black)),
              centerTitle: true,
              backgroundColor: Colors.white60,
              leading: Icon(Icons.arrow_back, color: Colors.black45),
              actions: [
                Icon(
                  Icons.share_rounded,
                  color: Colors.black45,
                ),
                SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.star,
                  color: Colors.black45,
                ),
              ],
              bottom: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: Colors.redAccent,
                indicatorPadding: EdgeInsets.symmetric(horizontal: 15),
                indicatorWeight: 2,
                automaticIndicatorColorAdjustment: true,
                physics: BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.fast),
                padding: EdgeInsets.all(10),
                labelColor: Colors.redAccent,
                unselectedLabelColor: Colors.redAccent,
                tabs: [
                  Tab(
                    text: "Latest",
                  ),
                  Tab(
                    text: "trending",
                  ),
                  Tab(
                    text: "sports",
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
               Home_screen(),
              ],
            )
        ),
      ),
    );
  }
}
