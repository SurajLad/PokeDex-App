class Move {
	String name;
	String url;

	Move({this.name, this.url});

	factory Move.fromJson(Map<String, dynamic> json) {
		return Move(
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
