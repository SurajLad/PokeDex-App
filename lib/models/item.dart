class Item {
	String name;
	String url;

	Item({this.name, this.url});

	factory Item.fromJson(Map<String, dynamic> json) {
		return Item(
			name: json['name'] as String,
			url: json['url'] as String,
		);
	}

	Map<String, dynamic> toJson() {
		return {
			'name': name,
			'url': url,
		};
	}
}
