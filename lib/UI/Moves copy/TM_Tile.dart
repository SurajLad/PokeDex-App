import 'package:flutter/material.dart';
import 'package:my_pokedex/Model/MovesList.dart';
import 'package:my_pokedex/UI/Moves/move_detail.dart';
import 'package:my_pokedex/Helpers/utility_helpers.dart';

class TMTile extends StatefulWidget {
  final Results moves;
  TMTile({this.moves});
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
            borderRadius: BorderRadius.circular(16),
          ),
          builder: (context) {
            return MoveDetailSheet(url: widget.moves.url);
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
              color: Colors.grey[400],
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
