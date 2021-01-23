// To parse this JSON data, do
//
//     final pokemon = pokemonFromJson(jsonString);

import 'dart:convert';

List<Pokemon> pokemonFromJson(String str) =>
    List<Pokemon>.from(json.decode(str).map((x) => Pokemon.fromJson(x)));

String pokemonToJson(List<Pokemon> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pokemon {
  Pokemon({
    this.dex,
    this.name,
    this.animationTime,
    this.height,
    this.weight,
    this.maxCp,
    this.buddySize,
    this.types,
    this.encounter,
    this.evolution,
    this.id,
    this.rarity,
  });

  int dex;
  String name;
  List<double> animationTime;
  double height;
  double weight;
  int maxCp;
  BuddySize buddySize;
  List<BuddySize> types;
  Encounter encounter;
  Evolution evolution;
  String id;
  BuddySize rarity;

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        dex: json["dex"],
        name: json["name"],
        height: json["height"].toDouble(),
        weight: json["weight"].toDouble(),
        maxCp: json["maxCP"],
        types: List<BuddySize>.from(
            json["types"].map((x) => BuddySize.fromJson(x))),
        encounter: Encounter.fromJson(json["encounter"]),
        evolution: Evolution.fromJson(json["evolution"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "dex": dex,
        "name": name,
        "animationTime": List<dynamic>.from(animationTime.map((x) => x)),
        "height": height,
        "weight": weight,
        "maxCP": maxCp,
        "buddySize": buddySize.toJson(),
        "types": List<dynamic>.from(types.map((x) => x.toJson())),
        "encounter": encounter.toJson(),
        "evolution": evolution.toJson(),
        "id": id,
        "rarity": rarity == null ? null : rarity.toJson(),
      };
}

class BuddySize {
  BuddySize({
    this.id,
    this.name,
  });

  String id;
  String name;

  factory BuddySize.fromJson(Map<String, dynamic> json) => BuddySize(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Encounter {
  Encounter({
    this.gender,
  });

  Gender gender;

  factory Encounter.fromJson(Map<String, dynamic> json) => Encounter(
        gender: json["gender"] == null ? null : Gender.fromJson(json["gender"]),
      );

  Map<String, dynamic> toJson() => {
        "gender": gender == null ? null : gender.toJson(),
      };
}

class Gender {
  Gender({
    this.malePercent,
    this.femalePercent,
  });

  double malePercent;
  double femalePercent;

  factory Gender.fromJson(Map<String, dynamic> json) => Gender(
        malePercent: json["malePercent"].toDouble(),
        femalePercent: json["femalePercent"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "malePercent": malePercent,
        "femalePercent": femalePercent,
      };
}

class Evolution {
  Evolution({
    this.futureBranches,
    this.pastBranch,
  });

  List<FutureBranch> futureBranches;
  Branch pastBranch;

  factory Evolution.fromJson(Map<String, dynamic> json) => Evolution(
        futureBranches: json["futureBranches"] == null
            ? null
            : List<FutureBranch>.from(
                json["futureBranches"].map((x) => FutureBranch.fromJson(x))),
        pastBranch: json["pastBranch"] == null
            ? null
            : Branch.fromJson(json["pastBranch"]),
      );

  Map<String, dynamic> toJson() => {
        "futureBranches": futureBranches == null
            ? null
            : List<dynamic>.from(futureBranches.map((x) => x.toJson())),
        "pastBranch": pastBranch == null ? null : pastBranch.toJson(),
      };
}

class FutureBranch {
  FutureBranch({
    this.name,
    this.id,
    this.futureBranches,
  });

  String name;
  String id;
  List<Branch> futureBranches;

  factory FutureBranch.fromJson(Map<String, dynamic> json) => FutureBranch(
        name: json["name"],
        id: json["id"],
        futureBranches: json["futureBranches"] == null
            ? null
            : List<Branch>.from(
                json["futureBranches"].map((x) => Branch.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "futureBranches": futureBranches == null
            ? null
            : List<dynamic>.from(futureBranches.map((x) => x.toJson())),
      };
}

class Branch {
  Branch({
    this.name,
    this.id,
    this.costToEvolve,
    this.pastBranch,
  });

  String name;
  String id;
  PastBranchCostToEvolve costToEvolve;
  BuddySize pastBranch;

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
        name: json["name"],
        id: json["id"],
        costToEvolve: json["costToEvolve"] == null
            ? null
            : PastBranchCostToEvolve.fromJson(json["costToEvolve"]),
        pastBranch: json["pastBranch"] == null
            ? null
            : BuddySize.fromJson(json["pastBranch"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "costToEvolve": costToEvolve == null ? null : costToEvolve.toJson(),
        "pastBranch": pastBranch == null ? null : pastBranch.toJson(),
      };
}

class PastBranchCostToEvolve {
  PastBranchCostToEvolve({
    this.candyCost,
    this.evolutionItem,
  });

  int candyCost;
  BuddySize evolutionItem;

  factory PastBranchCostToEvolve.fromJson(Map<String, dynamic> json) =>
      PastBranchCostToEvolve(
        candyCost: json["candyCost"],
        evolutionItem: json["evolutionItem"] == null
            ? null
            : BuddySize.fromJson(json["evolutionItem"]),
      );

  Map<String, dynamic> toJson() => {
        "candyCost": candyCost,
        "evolutionItem": evolutionItem == null ? null : evolutionItem.toJson(),
      };
}
