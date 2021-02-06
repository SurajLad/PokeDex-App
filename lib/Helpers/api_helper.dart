import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:my_pokedex/Model/Move_details.dart';
import 'package:my_pokedex/Model/MovesList.dart';
import 'package:my_pokedex/Model/moves.dart';
import 'package:my_pokedex/Model/news.dart';
import 'package:my_pokedex/Model/pokemonAPI.dart';

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

  Future<PokemonAPI> getPokemon(String index) async {
    PokemonAPI pokemonAPI;

    await dio
        .get("https://pokeapi.co/api/v2/pokemon/" + index)
        .then((receivedResponse) {
      Response response = receivedResponse;
      if (response.statusCode == 200) {
        pokemonAPI = PokemonAPI.fromJson(response.data);
      } else {
        return null;
      }
    }).catchError((onError) {
      print("Error : " + onError.toString());
      return null;
    });
    return pokemonAPI;
  }

  Future<MovesList> getMoves(String index) async {
    MovesList pokemonAPI;
    // print("https://pokeapi.co/api/v2/machine/" + index);

    await dio.get(index).then((receivedResponse) {
      Response response = receivedResponse;
      if (response.statusCode == 200) {
        pokemonAPI = MovesList.fromJson(response.data);
      } else {
        return null;
      }
    }).catchError((onError) {
      print("Error : " + onError.toString());
      return null;
    });
    return pokemonAPI;
  }

  Future<MoveDetail> getMoveDetail(String url) async {
    MoveDetail moveDetail;

    await dio.get(url).then((receivedResponse) {
      Response response = receivedResponse;
      if (response.statusCode == 200) {
        moveDetail = MoveDetail.fromJson(response.data);
      } else {
        return null;
      }
    }).catchError((onError) {
      print("Error : " + onError.toString());
      return null;
    });
    return moveDetail;
  }
}
