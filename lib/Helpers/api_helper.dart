import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
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
    News news;
    // print("https://newsapi.org/v2/everything?q=pokemon&from=" +
    //     DateFormat("yyyy-mm-dd")
    //         .format(DateTime.now().subtract(new Duration(days: 5))) +
    //     "&to=" +
    //     DateFormat("yyyy-mm-dd").format(DateTime.now()) +
    //     "&sortBy=popularity&apiKey=97f5536aca9c4c0995ede7bb29cf4e64");
    await dio
        .get("https://newsapi.org/v2/everything?q=pokemon&from=" +
            DateFormat("yyyy-mm-dd")
                .format(DateTime.now().subtract(new Duration(days: 5))) +
            "&to=" +
            DateFormat("yyyy-mm-dd").format(DateTime.now()) +
            "&sortBy=popularity&apiKey=97f5536aca9c4c0995ede7bb29cf4e64")
        .then((receivedResponse) {
      Response response = receivedResponse;
      if (response.statusCode == 200) {
        news = News.fromJson(response.data);
      } else {
        return null;
      }
    }).catchError((onError) {
      print("Error : " + onError.toString());
      return null;
    });
    return news;
  }

  // Future<Pokemon> getPokemon(String url) async {
  //   Pokemon pokemon;

  //   await dio.get(url).then((receivedResponse) {
  //     Response response = receivedResponse;
  //     if (response.statusCode == 200) {
  //       pokemon = Pokemon.fromJson(response.data);
  //     } else {
  //       return null;
  //     }
  //   }).catchError((onError) {
  //     print("Error : " + onError.toString());
  //     return null;
  //   });
  //   return pokemon;
  // }
}
