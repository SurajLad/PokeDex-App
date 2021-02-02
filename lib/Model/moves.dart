class TechnicalMachine {
  int id;
  Item item;
  Item move;
  Item versionGroup;

  TechnicalMachine({this.id, this.item, this.move, this.versionGroup});

  TechnicalMachine.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    item = json['item'] != null ? new Item.fromJson(json['item']) : null;
    move = json['move'] != null ? new Item.fromJson(json['move']) : null;
    versionGroup = json['version_group'] != null
        ? new Item.fromJson(json['version_group'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.item != null) {
      data['item'] = this.item.toJson();
    }
    if (this.move != null) {
      data['move'] = this.move.toJson();
    }
    if (this.versionGroup != null) {
      data['version_group'] = this.versionGroup.toJson();
    }
    return data;
  }
}

class Item {
  String name;
  String url;

  Item({this.name, this.url});

  Item.fromJson(Map<String, dynamic> json) {
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
