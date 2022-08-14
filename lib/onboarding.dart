import 'package:flutter/material.dart';
import 'package:news_app2/view/home_page.dart';

class OnBoardingScreen extends StatefulWidget {


  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();

}

class _OnBoardingScreenState extends State<OnBoardingScreen> {


  int splashtime = 5;


  @override
  void initState() {
    Future.delayed(Duration(seconds: splashtime), () async {
      Navigator.pushReplacement(context, MaterialPageRoute(
        //pushReplacement = replacing the route so that
        //splash screen won't show on back button press
        //navigation to Home page.
          builder: (context){
            return HomePage();
          }));
    });

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xff326789),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/news.png'),
            Center(
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(left: 70,right: 70),
                child: MaterialButton(onPressed: (){
                },
                color: Color(0xff326789),
                  child: Text("Loading...",style: TextStyle(color: Colors.white),),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Colors.grey)
                  ),
                  elevation: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
