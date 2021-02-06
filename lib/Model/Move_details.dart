class MoveDetail {
  int accuracy;
  ContestType contestType;
  ContestType damageClass;
  int id;
  List<LearnedByPokemon> learnedByPokemon;
  Meta meta;
  String name;
  int power;
  int pp;
  int priority;
  ContestType type;

  MoveDetail(
      {this.accuracy,
      this.contestType,
      this.damageClass,
      this.id,
      this.learnedByPokemon,
      this.meta,
      this.name,
      this.power,
      this.pp,
      this.priority,
      this.type});

  MoveDetail.fromJson(Map<String, dynamic> json) {
    accuracy = json['accuracy'];
    contestType = json['contest_type'] != null
        ? new ContestType.fromJson(json['contest_type'])
        : null;
    damageClass = json['damage_class'] != null
        ? new ContestType.fromJson(json['damage_class'])
        : null;
    id = json['id'];
    if (json['learned_by_pokemon'] != null) {
      learnedByPokemon = new List<LearnedByPokemon>();
      json['learned_by_pokemon'].forEach((v) {
        learnedByPokemon.add(new LearnedByPokemon.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    name = json['name'];
    power = json['power'];
    pp = json['pp'];
    priority = json['priority'];
    type = json['type'] != null ? new ContestType.fromJson(json['type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accuracy'] = this.accuracy;
    if (this.contestType != null) {
      data['contest_type'] = this.contestType.toJson();
    }
    if (this.damageClass != null) {
      data['damage_class'] = this.damageClass.toJson();
    }
    data['id'] = this.id;
    if (this.learnedByPokemon != null) {
      data['learned_by_pokemon'] =
          this.learnedByPokemon.map((v) => v.toJson()).toList();
    }
    if (this.meta != null) {
      data['meta'] = this.meta.toJson();
    }
    data['name'] = this.name;
    data['power'] = this.power;
    data['pp'] = this.pp;
    data['priority'] = this.priority;
    if (this.type != null) {
      data['type'] = this.type.toJson();
    }
    return data;
  }
}

class ContestType {
  String name;

  ContestType({this.name});

  ContestType.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}

class LearnedByPokemon {
  String name;
  String url;

  LearnedByPokemon({this.name, this.url});

  LearnedByPokemon.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}

class Meta {
  int ailmentChance;
  int critRate;
  int drain;
  int flinchChance;
  int healing;
  int statChance;

  Meta(
      {this.ailmentChance,
      this.critRate,
      this.drain,
      this.flinchChance,
      this.healing,
      this.statChance});

  Meta.fromJson(Map<String, dynamic> json) {
    ailmentChance = json['ailment_chance'];
    critRate = json['crit_rate'];
    drain = json['drain'];
    flinchChance = json['flinch_chance'];
    healing = json['healing'];
    statChance = json['stat_chance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ailment_chance'] = this.ailmentChance;
    data['crit_rate'] = this.critRate;
    data['drain'] = this.drain;
    data['flinch_chance'] = this.flinchChance;
    data['healing'] = this.healing;
    data['stat_chance'] = this.statChance;
    return data;
  }
}
