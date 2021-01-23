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
    this.modelHeight,
    this.kmBuddyDistance,
    this.weight,
    this.modelScale,
    this.maxCp,
    this.buddySize,
    this.cinematicMoves,
    this.quickMoves,
    this.family,
    this.stats,
    this.types,
    this.encounter,
    this.camera,
    this.evolution,
    this.id,
    this.forms,
    this.rarity,
  });

  int dex;
  String name;
  List<double> animationTime;
  double height;
  double modelHeight;
  int kmBuddyDistance;
  double weight;
  double modelScale;
  int maxCp;
  BuddySize buddySize;
  List<Move> cinematicMoves;
  List<Move> quickMoves;
  BuddySize family;
  Stats stats;
  List<BuddySize> types;
  Encounter encounter;
  Camera camera;
  Evolution evolution;
  String id;
  List<BuddySize> forms;
  BuddySize rarity;

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        dex: json["dex"],
        name: json["name"],
        height: json["height"].toDouble(),
        modelHeight: json["modelHeight"].toDouble(),
        kmBuddyDistance: json["kmBuddyDistance"],
        weight: json["weight"].toDouble(),
        modelScale: json["modelScale"].toDouble(),
        maxCp: json["maxCP"],
        cinematicMoves: List<Move>.from(
            json["cinematicMoves"].map((x) => Move.fromJson(x))),
        quickMoves:
            List<Move>.from(json["quickMoves"].map((x) => Move.fromJson(x))),
        family: BuddySize.fromJson(json["family"]),
        stats: Stats.fromJson(json["stats"]),
        types: List<BuddySize>.from(
            json["types"].map((x) => BuddySize.fromJson(x))),
        encounter: Encounter.fromJson(json["encounter"]),
        camera: Camera.fromJson(json["camera"]),
        evolution: Evolution.fromJson(json["evolution"]),
        id: json["id"],
        rarity:
            json["rarity"] == null ? null : BuddySize.fromJson(json["rarity"]),
      );

  Map<String, dynamic> toJson() => {
        "dex": dex,
        "name": name,
        "animationTime": List<dynamic>.from(animationTime.map((x) => x)),
        "height": height,
        "modelHeight": modelHeight,
        "kmBuddyDistance": kmBuddyDistance,
        "weight": weight,
        "modelScale": modelScale,
        "maxCP": maxCp,
        "buddySize": buddySize.toJson(),
        "cinematicMoves":
            List<dynamic>.from(cinematicMoves.map((x) => x.toJson())),
        "quickMoves": List<dynamic>.from(quickMoves.map((x) => x.toJson())),
        "family": family.toJson(),
        "stats": stats.toJson(),
        "types": List<dynamic>.from(types.map((x) => x.toJson())),
        "encounter": encounter.toJson(),
        "camera": camera.toJson(),
        "evolution": evolution.toJson(),
        "id": id,
        "forms": List<dynamic>.from(forms.map((x) => x.toJson())),
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

class Camera {
  Camera({
    this.cylinderRadius,
    this.diskRadius,
    this.shoulderModeScale,
    this.cylinderGround,
  });

  double cylinderRadius;
  double diskRadius;
  double shoulderModeScale;
  double cylinderGround;

  factory Camera.fromJson(Map<String, dynamic> json) => Camera(
        cylinderRadius: json["cylinderRadius"].toDouble(),
        diskRadius: json["diskRadius"].toDouble(),
        shoulderModeScale: json["shoulderModeScale"] == null
            ? null
            : json["shoulderModeScale"].toDouble(),
        cylinderGround: json["cylinderGround"] == null
            ? null
            : json["cylinderGround"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "cylinderRadius": cylinderRadius,
        "diskRadius": diskRadius,
        "shoulderModeScale":
            shoulderModeScale == null ? null : shoulderModeScale,
        "cylinderGround": cylinderGround == null ? null : cylinderGround,
      };
}

class Move {
  Move({
    this.name,
    this.id,
    this.legacy,
  });

  String name;
  String id;
  bool legacy;

  factory Move.fromJson(Map<String, dynamic> json) => Move(
        name: json["name"],
        id: json["id"],
        legacy: json["legacy"] == null ? null : json["legacy"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "legacy": legacy == null ? null : legacy,
      };
}

class Encounter {
  Encounter({
    this.attackProbability,
    this.attackTimer,
    this.baseFleeRate,
    this.baseCaptureRate,
    this.cameraDistance,
    this.collisionRadius,
    this.dodgeDistance,
    this.dodgeProbability,
    this.jumpTime,
    this.maxPokemonActionFrequency,
    this.minPokemonActionFrequency,
    this.movementType,
    this.gender,
  });

  double attackProbability;
  int attackTimer;
  double baseFleeRate;
  double baseCaptureRate;
  double cameraDistance;
  double collisionRadius;
  double dodgeDistance;
  double dodgeProbability;
  double jumpTime;
  double maxPokemonActionFrequency;
  double minPokemonActionFrequency;
  BuddySize movementType;
  Gender gender;

  factory Encounter.fromJson(Map<String, dynamic> json) => Encounter(
        attackProbability: json["attackProbability"] == null
            ? null
            : json["attackProbability"].toDouble(),
        attackTimer: json["attackTimer"],
        baseFleeRate: json["baseFleeRate"] == null
            ? null
            : json["baseFleeRate"].toDouble(),
        baseCaptureRate: json["baseCaptureRate"] == null
            ? null
            : json["baseCaptureRate"].toDouble(),
        cameraDistance: json["cameraDistance"].toDouble(),
        collisionRadius: json["collisionRadius"].toDouble(),
        dodgeDistance: json["dodgeDistance"].toDouble(),
        dodgeProbability: json["dodgeProbability"] == null
            ? null
            : json["dodgeProbability"].toDouble(),
        jumpTime: json["jumpTime"] == null ? null : json["jumpTime"].toDouble(),
        maxPokemonActionFrequency: json["maxPokemonActionFrequency"].toDouble(),
        minPokemonActionFrequency: json["minPokemonActionFrequency"].toDouble(),
        movementType: json["movementType"] == null
            ? null
            : BuddySize.fromJson(json["movementType"]),
        gender: json["gender"] == null ? null : Gender.fromJson(json["gender"]),
      );

  Map<String, dynamic> toJson() => {
        "attackProbability":
            attackProbability == null ? null : attackProbability,
        "attackTimer": attackTimer,
        "baseFleeRate": baseFleeRate == null ? null : baseFleeRate,
        "baseCaptureRate": baseCaptureRate == null ? null : baseCaptureRate,
        "cameraDistance": cameraDistance,
        "collisionRadius": collisionRadius,
        "dodgeDistance": dodgeDistance,
        "dodgeProbability": dodgeProbability == null ? null : dodgeProbability,
        "jumpTime": jumpTime == null ? null : jumpTime,
        "maxPokemonActionFrequency": maxPokemonActionFrequency,
        "minPokemonActionFrequency": minPokemonActionFrequency,
        "movementType": movementType == null ? null : movementType.toJson(),
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

class Stats {
  Stats({
    this.baseAttack,
    this.baseDefense,
    this.baseStamina,
  });

  int baseAttack;
  int baseDefense;
  int baseStamina;

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        baseAttack: json["baseAttack"],
        baseDefense: json["baseDefense"],
        baseStamina: json["baseStamina"],
      );

  Map<String, dynamic> toJson() => {
        "baseAttack": baseAttack,
        "baseDefense": baseDefense,
        "baseStamina": baseStamina,
      };
}
