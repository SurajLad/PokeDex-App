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
    news = await APIHelper().getNews();
    update();
  }
}
