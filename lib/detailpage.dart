import 'package:api_map/home%20screen/provider/homeprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Detail_screen extends StatefulWidget {
  const Detail_screen({Key? key}) : super(key: key);

  @override
  State<Detail_screen> createState() => _Detail_screenState();
}

class _Detail_screenState extends State<Detail_screen> {
  Homeprovider? trueprov;
  Homeprovider? falseprov;

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)?.settings.arguments as int;
    trueprov = Provider.of<Homeprovider>(context, listen: true);
    falseprov = Provider.of<Homeprovider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Latest News",style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          leading: Icon(Icons.arrow_back,color: Colors.black45,),
          actions: [
            Icon(Icons.share,color: Colors.black45,),
            SizedBox(width: 20,),
            Icon(Icons.star,color: Colors.black45,),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.red,
                  height: 250,
                  width: double.infinity,
                  child: Image.network(
                    "${trueprov!.homeModel!.articles![index].urlToImage}",
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(height: 20,),
                Text("${trueprov!.homeModel!.articles![index].title}",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,letterSpacing: 1)),
                SizedBox(height: 20,),
                Text("- ${trueprov!.homeModel!.articles![index].author}",style: TextStyle(color: Colors.black54,letterSpacing: 1,fontWeight: FontWeight.bold,fontSize: 15),),
                SizedBox(height: 10,),
Divider(),
                Text("${trueprov!.homeModel!.articles![index].content}.",style: TextStyle(letterSpacing: 1,fontSize: 18)),
                SizedBox(height: 10,),
                Text("${trueprov!.homeModel!.articles![index].description}",style: TextStyle(letterSpacing: 1,fontSize: 18)),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
