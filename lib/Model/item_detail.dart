class ItemDetail {
  List<Attributes> attributes;
  Attributes category;
  int cost;
  List<EffectEntries> effectEntries;
  String flingEffect;
  int flingPower;
  int id;
  String name;
  Sprites sprites;

  ItemDetail(
      {this.attributes,
      this.category,
      this.cost,
      this.effectEntries,
      this.flingEffect,
      this.flingPower,
      this.id,
      this.name,
      this.sprites});

  ItemDetail.fromJson(Map<String, dynamic> json) {
    if (json['attributes'] != null) {
      attributes = new List<Attributes>();
      json['attributes'].forEach((v) {
        attributes.add(new Attributes.fromJson(v));
      });
    }
    category = json['category'] != null
        ? new Attributes.fromJson(json['category'])
        : null;
    cost = json['cost'];
    if (json['effect_entries'] != null) {
      effectEntries = new List<EffectEntries>();
      json['effect_entries'].forEach((v) {
        effectEntries.add(new EffectEntries.fromJson(v));
      });
    }
    flingEffect = json['fling_effect'.toString()];
    flingPower = json['fling_power'];
    id = json['id'];
    name = json['name'];
    sprites =
        json['sprites'] != null ? new Sprites.fromJson(json['sprites']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.attributes != null) {
      data['attributes'] = this.attributes.map((v) => v.toJson()).toList();
    }
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    data['cost'] = this.cost;
    if (this.effectEntries != null) {
      data['effect_entries'] =
          this.effectEntries.map((v) => v.toJson()).toList();
    }
    data['fling_effect'] = this.flingEffect;
    data['fling_power'] = this.flingPower;
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.sprites != null) {
      data['sprites'] = this.sprites.toJson();
    }
    return data;
  }
}

class Attributes {
  String name;
  String url;

  Attributes({this.name, this.url});

  Attributes.fromJson(Map<String, dynamic> json) {
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

class EffectEntries {
  String effect;
  Attributes language;
  String shortEffect;

  EffectEntries({this.effect, this.language, this.shortEffect});

  EffectEntries.fromJson(Map<String, dynamic> json) {
    effect = json['effect'];
    language = json['language'] != null
        ? new Attributes.fromJson(json['language'])
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

class Sprites {
  String url;

  Sprites({this.url});

  Sprites.fromJson(Map<String, dynamic> json) {
    url = json['default'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['default'] = this.url;
    return data;
  }
}

class Item {
  List<Attributes> attributes;
  Attributes category;
  int cost;
  List<EffectEntries> effectEntries;
  Null flingEffect;
  int flingPower;
  int id;
  String name;
  Sprites sprites;

  Item(
      {this.attributes,
      this.category,
      this.cost,
      this.effectEntries,
      this.flingEffect,
      this.flingPower,
      this.id,
      this.name,
      this.sprites});

  Item.fromJson(Map<String, dynamic> json) {
    if (json['attributes'] != null) {
      attributes = new List<Attributes>();
      json['attributes'].forEach((v) {
        attributes.add(new Attributes.fromJson(v));
      });
    }
    category = json['category'] != null
        ? new Attributes.fromJson(json['category'])
        : null;
    cost = json['cost'];
    if (json['effect_entries'] != null) {
      effectEntries = new List<EffectEntries>();
      json['effect_entries'].forEach((v) {
        effectEntries.add(new EffectEntries.fromJson(v));
      });
    }
    flingEffect = json['fling_effect'];
    flingPower = json['fling_power'];
    id = json['id'];
    name = json['name'];
    sprites =
        json['sprites'] != null ? new Sprites.fromJson(json['sprites']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.attributes != null) {
      data['attributes'] = this.attributes.map((v) => v.toJson()).toList();
    }
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    data['cost'] = this.cost;
    if (this.effectEntries != null) {
      data['effect_entries'] =
          this.effectEntries.map((v) => v.toJson()).toList();
    }
    data['fling_effect'] = this.flingEffect;
    data['fling_power'] = this.flingPower;
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.sprites != null) {
      data['sprites'] = this.sprites.toJson();
    }
    return data;
  }
}
