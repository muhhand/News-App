import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:news_app2/BottomNavBar/general.dart';
import 'package:news_app2/BottomNavBar/health.dart';
import 'package:news_app2/BottomNavBar/science.dart';
import 'package:news_app2/BottomNavBar/sports.dart';
import 'package:news_app2/BottomNavBar/tech.dart';
import 'package:news_app2/controller/news_controller.dart';
import 'package:news_app2/model/news_model.dart';



class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NewsController controller = Get.put(NewsController());

  List<Widget> screens = [
    GeneralPage(),
    SportsPage(),
    HealthPage(),
    SciencePage(),
    TechPage(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('News Today'),backgroundColor: Color(0xff326789),
        leading: Icon(Icons.newspaper),
      ),
      body: GetX<NewsController>(builder: (controller)=> screens[controller.currentIndex.value]),
      bottomNavigationBar:  BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: controller.currentIndex.value,
        onTap: (val){
          setState((){
            controller.currentIndex.value=val;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.category),label: "General"),
          BottomNavigationBarItem(icon: Icon(Icons.sports),label: "Sports"),
          BottomNavigationBarItem(icon: Icon(Icons.health_and_safety),label: "Health"),
          BottomNavigationBarItem(icon: Icon(Icons.science),label: "Science"),
          BottomNavigationBarItem(icon: Icon(Icons.military_tech),label: "technology"),
        ],
        selectedItemColor: Color(0xff78A6C8),
      ),
    );
  }
}