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
            return MoveDetails(url: widget.moves.url);
          },
        );
      },
      child: Container(
          margin: const EdgeInsets.only(bottom: 8.0),
          height: 80,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black38),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            leading: Image.asset(
              "Assets/poke_move.png",
              height: 60,
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
