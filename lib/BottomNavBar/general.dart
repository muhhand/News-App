import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:news_app2/controller/news_controller.dart';
import 'package:news_app2/model/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

class GeneralPage extends GetWidget{
  NewsController controller = Get.put(NewsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: FutureBuilder(
        future: controller.getData("general"),
        builder: (context , AsyncSnapshot snapshot){
          Welcome data = snapshot.data;
          if (snapshot.hasData){
            return ListView.builder(
                itemCount: data.articles.length,
                itemBuilder: (context, int index){
                  return Column(
                    children: [
                      Card(
                        margin: EdgeInsets.all(15),
                        shadowColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: InkWell(
                          onTap: () async {
                            final url = Uri.parse(data.articles[index].url);
                            if(await canLaunchUrl(url)){
                              await launchUrl(url);
                            }else {
                              throw 'Could not launch $url';
                            }
                          },
                          child: Column(
                            children: [
                              Container(
                                  width: double.infinity,
                                  child:
                                  Image.network(data.articles[index].urlToImage == null ?  'https://cdn11.bigcommerce.com/s-y76tsfzldy/images/stencil/original/products/7720/20309/360_F_400243185_BOxON3h9avMUX10RsDkt3pJ8iQx72kS3__32888.1644948713.jpg' : data.articles[index].urlToImage.toString(),fit: BoxFit.fill,)),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(data.articles[index].title,textDirection: TextDirection.rtl,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(data.articles[index].description == null ? '' : data.articles[index].description,textDirection: TextDirection.rtl,maxLines: 3, overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 15,color: Colors.grey,)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        indent: 50,
                        endIndent: 50,
                      ),
                    ],
                  );
                });

          } else {
            return Center(child: CircularProgressIndicator(color: Color(0xff78A6C8),));
          }

        },
      ),
    );
  }

}