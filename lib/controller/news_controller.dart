import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news_app2/model/news_model.dart';

class NewsController extends GetxController {
  RxInt currentIndex = 0.obs;
  getData(String cat) async {
    final url = Uri.parse('https://newsapi.org/v2/top-headlines?country=eg&pageSize=100&category=${cat}&apiKey=fbcd6bf008b443908f94f396a3435935');
    http.Response response = await http.get(url);


    if (response.statusCode == 200){
      try {
        return Welcome.fromJson(jsonDecode(response.body));
      }catch(e){
        Get.snackbar('error', e.toString());
      }
    }

  }
}