import 'package:api_map/home%20screen/provider/homeprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({Key? key}) : super(key: key);

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  Homeprovider? truepro;
  Homeprovider? falsepro;

  @override
  void initState() {
    super.initState();
    Provider.of<Homeprovider>(context, listen: false).newsApiCall();
  }

  @override
  Widget build(BuildContext context) {
    truepro = Provider.of<Homeprovider>(context, listen: true);
    falsepro = Provider.of<Homeprovider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: truepro!.homeModel == null
            ? Center(
                child: CircularProgressIndicator(
                color: Colors.redAccent,
              ))
            : ListView.builder(
                itemCount: truepro!.homeModel!.articles!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, 'detail',arguments: index);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("See More",
                                    style: TextStyle(color: Colors.redAccent)),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.redAccent,
                                  size: 12,
                                )
                              ],
                            ),
                          ),
                        ),
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 130,
                                  width: 100,
                                  child: Image.network(
                                      "${truepro!.homeModel!.articles![index].urlToImage}",
                                      fit: BoxFit.fill),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 230,
                                      child: Align(
                                        child: Text(
                                            "${truepro!.homeModel!.articles![index].title}",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    Text(
                                        "40 minutes ago",
                                        style: TextStyle(
                                            fontSize: 12,
                                            letterSpacing: 1,color: Colors.black45,fontWeight: FontWeight.bold)),
                                    // SizedBox(
                                    //   width: 250,
                                    //   child: Text(
                                    //       "${truepro!.homeModel!.articles![index].description}",
                                    //       style: TextStyle(fontSize: 8)),
                                    // ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Divider(color: Colors.redAccent, height: 2),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
