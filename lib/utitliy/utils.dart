import 'package:flutter/material.dart';
import 'package:my_pokedex/Model/pokemon.dart';

String getStatString(String stat) {
  switch (stat) {
    case "hp":
      return "HP";
      break;

    case "attack":
      return "Attack";
      break;

    case "defense":
      return "Defense";
      break;

    case "special-attack":
      return "Sp. Attack";
      break;

    case "special-defense":
      return "Sp. Defense";
      break;

    case "speed":
      return "Speed";

      return "";
  }
}

getStatsColor(int stat) {
  if (stat < 45) {
    return new AlwaysStoppedAnimation(Colors.red);
  } else if (stat > 45 && stat < 60) {
    return new AlwaysStoppedAnimation(Colors.amber[600]);
  } else {
    return new AlwaysStoppedAnimation(Colors.green);
  }
}

getDexFromName(String name, List<Pokemon> pokemonList) {
  for (Pokemon pokemon in pokemonList) {
    if (pokemon.name == name) {
      return pokemon.dex;
    }
  }
  return 1;
}
