class AbilityDetail {
  List<EffectEntries> effectEntries;
  int id;
  bool isMainSeries;
  String name;
  List<Pokemon> pokemon;

  AbilityDetail(
      {this.effectEntries,
      this.id,
      this.isMainSeries,
      this.name,
      this.pokemon});

  AbilityDetail.fromJson(Map<String, dynamic> json) {
    if (json['effect_entries'] != null) {
      effectEntries = new List<EffectEntries>();
      json['effect_entries'].forEach((v) {
        effectEntries.add(new EffectEntries.fromJson(v));
      });
    }
    id = json['id'];
    isMainSeries = json['is_main_series'];
    name = json['name'];
    if (json['pokemon'] != null) {
      pokemon = new List<Pokemon>();
      json['pokemon'].forEach((v) {
        pokemon.add(new Pokemon.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.effectEntries != null) {
      data['effect_entries'] =
          this.effectEntries.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    data['is_main_series'] = this.isMainSeries;
    data['name'] = this.name;
    if (this.pokemon != null) {
      data['pokemon'] = this.pokemon.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EffectEntries {
  String effect;
  Language language;
  String shortEffect;

  EffectEntries({this.effect, this.language, this.shortEffect});

  EffectEntries.fromJson(Map<String, dynamic> json) {
    effect = json['effect'];
    language = json['language'] != null
        ? new Language.fromJson(json['language'])
        : null;
    shortEffect = json['short_effect'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['effect'] = this.effect;
    if (this.language != null) {
      data['language'] = this.language.toJson();
    }
    data['short_effect'] = this.shortEffect;
    return data;
  }
}

class Language {
  String name;
  String url;

  Language({this.name, this.url});

  Language.fromJson(Map<String, dynamic> json) {
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

class Pokemon {
  Language pokemon;

  Pokemon({this.pokemon});

  Pokemon.fromJson(Map<String, dynamic> json) {
    pokemon =
        json['pokemon'] != null ? new Language.fromJson(json['pokemon']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pokemon != null) {
      data['pokemon'] = this.pokemon.toJson();
    }
    return data;
  }
}
