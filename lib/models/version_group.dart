class VersionGroup {
	String name;
	String url;

	VersionGroup({this.name, this.url});

	factory VersionGroup.fromJson(Map<String, dynamic> json) {
		return VersionGroup(
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
