class TypeDetail {
  DamageRelations damageRelations;
  int id;
  DamageType moveDamageClass;
  String name;

  TypeDetail({this.damageRelations, this.id, this.moveDamageClass, this.name});

  TypeDetail.fromJson(Map<String, dynamic> json) {
    damageRelations = json['damage_relations'] != null
        ? new DamageRelations.fromJson(json['damage_relations'])
        : null;
    id = json['id'];
    moveDamageClass = json['move_damage_class'] != null
        ? new DamageType.fromJson(json['move_damage_class'])
        : null;
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.damageRelations != null) {
      data['damage_relations'] = this.damageRelations.toJson();
    }
    data['id'] = this.id;
    if (this.moveDamageClass != null) {
      data['move_damage_class'] = this.moveDamageClass.toJson();
    }
    data['name'] = this.name;
    return data;
  }
}

class DamageRelations {
  List<DamageType> doubleDamageFrom;
  List<DamageType> doubleDamageTo;
  List<DamageType> halfDamageFrom;
  List<DamageType> halfDamageTo;
  List<DamageType> noDamageFrom;
  List<DamageType> noDamageTo;

  DamageRelations(
      {this.doubleDamageFrom,
      this.doubleDamageTo,
      this.halfDamageFrom,
      this.halfDamageTo,
      this.noDamageFrom,
      this.noDamageTo});

  DamageRelations.fromJson(Map<String, dynamic> json) {
    if (json['double_damage_from'] != null) {
      doubleDamageFrom = <DamageType>[];
      json['double_damage_from'].forEach((v) {
        doubleDamageFrom.add(new DamageType.fromJson(v));
      });
    }
    if (json['double_damage_to'] != null) {
      doubleDamageTo = <DamageType>[];
      json['double_damage_to'].forEach((v) {
        doubleDamageTo.add(new DamageType.fromJson(v));
      });
    }
    if (json['half_damage_from'] != null) {
      halfDamageFrom = <DamageType>[];
      json['half_damage_from'].forEach((v) {
        halfDamageFrom.add(new DamageType.fromJson(v));
      });
    }
    if (json['half_damage_to'] != null) {
      halfDamageTo = <DamageType>[];
      json['half_damage_to'].forEach((v) {
        halfDamageTo.add(new DamageType.fromJson(v));
      });
    }
    if (json['no_damage_from'] != null) {
      noDamageFrom = <DamageType>[];
      json['no_damage_from'].forEach((v) {
        noDamageFrom.add(new DamageType.fromJson(v));
      });
    }
    if (json['no_damage_to'] != null) {
      noDamageTo = <DamageType>[];
      json['no_damage_to'].forEach((v) {
        noDamageTo.add(new DamageType.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.doubleDamageFrom != null) {
      data['double_damage_from'] =
          this.doubleDamageFrom.map((v) => v.toJson()).toList();
    }
    if (this.doubleDamageTo != null) {
      data['double_damage_to'] =
          this.doubleDamageTo.map((v) => v.toJson()).toList();
    }
    if (this.halfDamageFrom != null) {
      data['half_damage_from'] =
          this.halfDamageFrom.map((v) => v.toJson()).toList();
    }
    if (this.halfDamageTo != null) {
      data['half_damage_to'] =
          this.halfDamageTo.map((v) => v.toJson()).toList();
    }
    if (this.noDamageFrom != null) {
      data['no_damage_from'] =
          this.noDamageFrom.map((v) => v.toJson()).toList();
    }
    if (this.noDamageTo != null) {
      data['no_damage_to'] = this.noDamageTo.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DamageType {
  String name;
  String url;

  DamageType({this.name, this.url});

  DamageType.fromJson(Map<String, dynamic> json) {
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
