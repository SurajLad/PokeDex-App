import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:my_pokedex/Helpers/api_helper.dart';
import 'package:my_pokedex/Model/news.dart';

class HomeController extends GetxController {
  News news;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getData() async {
    await getNews().then((value) {
      print(value);
    });
    // print(news);
  }

  getNews() async {
    var response;
    await Dio()
        .get(
            "https://newsapi.org/v2/everything?q=pokemon&from=2020-12-01&sortBy=publishedAt&apiKey=97f5536aca9c4c0995ede7bb29cf4e64")
        .then((receivedResponse) {
      response = receivedResponse;
      print(response);
      if (response.statusCode == 200) {
        //print(response);
        News news = News.fromJson(response.data);
        print(news);
        return news;
      } else {
        //print(response);

      }
    }).catchError((onError) {
      print("Error : " + onError.toString());
    });
  }
}
