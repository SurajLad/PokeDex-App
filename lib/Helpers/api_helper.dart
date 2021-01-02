import 'package:dio/dio.dart';
import 'package:my_pokedex/Model/news.dart';

class APIHelper {
  static Dio dio;
  static final APIHelper apiHelper = APIHelper._internal();

  factory APIHelper() {
    dio = new Dio();
    return apiHelper;
  }
  APIHelper._internal();

  Future<News> getNews() async {
    Response response;
    await dio
        .get(
            "https://newsapi.org/v2/everything?q=pokemon&from=2020-12-01&sortBy=publishedAt&apiKey=97f5536aca9c4c0995ede7bb29cf4e64")
        .then((receivedResponse) {
      response = receivedResponse;
      print(response);
      if (response.statusCode == 200) {
        print(response);
        News news = News.fromJson(response.data);
        return news;
      } else {
        //print(response);
        return null;
      }
    }).catchError((onError) {
      print("Error : " + onError.toString());
      return null;
    });
    return null;
  }
}
