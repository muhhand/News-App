
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:news_app2/controller/news_controller.dart';
import 'package:news_app2/model/news_model.dart';
import 'package:url_launcher/url_launcher.dart';




class SportsPage extends GetWidget{
  NewsController controller = Get.put(NewsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: FutureBuilder(
          future: controller.getData("sports"),
          builder: (context , AsyncSnapshot snapshot){
            Welcome data = snapshot.data;
            if (snapshot.hasData){
              return ListView.builder(
                  itemCount: data.articles.length,
                  itemBuilder: (context, int index){
                    return InkWell(
                      onTap: () async {
                        final url = Uri.parse(data.articles[index].url);
                        if(await canLaunchUrl(url)){
                          await launchUrl(url);
                        }else {
                          throw 'Could not launch $url';
                        }
                      },
                      child: Card(
                        color: Colors.white,
                        elevation: 0,
                        borderOnForeground: false,
                        margin: EdgeInsets.all(10),
                        child:
                        ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                            title: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(data.articles[index].source.name,textDirection: TextDirection.rtl,style: TextStyle(fontSize: 10,color: Color(0xffE65C4F),fontWeight: FontWeight.bold),),
                              ],
                            ),
                            subtitle: Text(data.articles[index].title == null ? '' : data.articles[index].title,textDirection: TextDirection.rtl,maxLines: 3, overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 14,color: Colors.black,)),
                            trailing:  ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(data.articles[index].urlToImage == null ?  'https://cdn11.bigcommerce.com/s-y76tsfzldy/images/stencil/original/products/7720/20309/360_F_400243185_BOxON3h9avMUX10RsDkt3pJ8iQx72kS3__32888.1644948713.jpg' : data.articles[index].urlToImage.toString(),width: 100,),
                            ),

                        ),
                      ),
                    );
                  });

            } else {
              return Center(child: CircularProgressIndicator(color: Color(0xff78A6C8),));
            }

          },
        ),
      ),
    );
  }

}