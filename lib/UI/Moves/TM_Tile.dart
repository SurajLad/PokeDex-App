import 'package:flutter/material.dart';
import 'package:my_pokedex/Model/MovesList.dart';
import 'package:my_pokedex/UI/Abilities/ability_detail.dart';
import 'package:my_pokedex/UI/Items/Item_detail_sheet.dart';
import 'package:my_pokedex/UI/Moves/move_detail.dart';
import 'package:my_pokedex/Helpers/utility_helpers.dart';
import 'package:my_pokedex/UI/Types/type_details.dart';

class TMTile extends StatefulWidget {
  final Results moves;
  final int type;
  TMTile({this.moves, this.type});
  @override
  _TMTileState createState() => _TMTileState();
}

class _TMTileState extends State<TMTile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          builder: (context) {
            switch (widget.type) {
              case 0:
                return MoveDetailSheet(url: widget.moves.url);
                break;

              case 1:
                return AbilityDetailSheet(url: widget.moves.url);
                break;

              case 2:
                return ItemDetailSheet(url: widget.moves.url);
                break;

              case 3:
                return TypeDetailsSheet(url: widget.moves.url);
                break;

              default:
                return Container();
            }
          },
        );
      },
      child: Container(
          margin: const EdgeInsets.only(bottom: 8.0, left: 4, right: 4),
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0.0, 1.0),
                  blurRadius: 8.0,
                  color: Colors.black12,
                )
              ]),
          child: ListTile(
            leading: Image.asset(
              "Assets/poke_move.png",
              height: 30,
              color: Colors.black45,
            ),
            title: Text(
              widget.moves == null
                  ? "pokemon.name"
                  : widget.moves.name.capitalizeFirst.replaceAll('-', " "),
            ),
          )),
    );
  }
}
