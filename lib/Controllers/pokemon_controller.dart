import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:my_pokedex/Helpers/api_helper.dart';
import 'package:my_pokedex/Model/pokemonAPI.dart';

class PokemonController extends GetxController {
  PokemonAPI pokemonAPI;
  @override
  void onInit() {
    super.onInit();
  }

  void getPokemonDetails(String index) async {
    pokemonAPI = await APIHelper().getPokemon(index);
    update();
  }
}
