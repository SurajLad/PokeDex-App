import "item.dart";
import "move.dart";
import "version_group.dart";

class Moves {
	int id;
	Item item;
	Move move;
	VersionGroup versionGroup;

	Moves({
		this.id,
		this.item,
		this.move,
		this.versionGroup,
	});

	factory Moves.fromJson(Map<String, dynamic> json) {
		return Moves(
			id: json['id'] as int,
			item: json['item'] == null
					? null
					: Item.fromJson(json['item'] as Map<String, dynamic>),
			move: json['move'] == null
					? null
					: Move.fromJson(json['move'] as Map<String, dynamic>),
			versionGroup: json['version_group'] == null
					? null
					: VersionGroup.fromJson(json['version_group'] as Map<String, dynamic>),
		);
	}

	Map<String, dynamic> toJson() {
		return {
			'id': id,
			'item': item?.toJson(),
			'move': move?.toJson(),
			'version_group': versionGroup?.toJson(),
		};
	}
}
