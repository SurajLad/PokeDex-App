import 'package:get/get.dart';
import 'package:my_pokedex/UI/PokeDex_UI/pokemon_list.dart';
import 'package:my_pokedex/UI/home_page.dart';
import 'package:my_pokedex/UI/splash_page.dart';
import 'package:my_pokedex/routes/routes.dart';

class AppPages {
  static final appPages = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashPage(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
    ),
    GetPage(
      name: Routes.POKEDEX,
      page: () => PokeDexList(),
    ),
  ];
}
