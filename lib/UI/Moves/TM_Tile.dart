import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_pokedex/Helpers/text_styles.dart';
import 'package:my_pokedex/Model/MovesList.dart';
import 'package:my_pokedex/UI/Abilities/ability_detail.dart';
import 'package:my_pokedex/UI/Items/Item_detail_sheet.dart';
import 'package:my_pokedex/UI/Moves/move_detail.dart';
import 'package:my_pokedex/Helpers/utility_helpers.dart';
import 'package:my_pokedex/UI/Types/type_details.dart';
import 'package:my_pokedex/utitliy/constants.dart';

class TMTile extends StatefulWidget {
  final Results moves;
  final int type;
  final String imgUrl;
  TMTile({this.moves, this.type, this.imgUrl});
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
        if (widget.type != 4) {
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
        }
      },
      child: Container(
          margin: const EdgeInsets.only(bottom: 10.0, left: 6, right: 6),
          height: 60,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0.0, .5),
                  blurRadius: 8.0,
                  color: Colors.grey[300],
                )
              ]),
          child: ListTile(
            leading: widget.type != 3
                ? Image.asset(
                    widget.imgUrl,
                    height: 40,
                  )
                : SvgPicture.asset(
                    "Assets/pokemon_type_icons/" +
                        widget.moves.name.capitalizeFirst +
                        ".svg",
                    color: pokemonTypeMap[widget.moves.name.capitalizeFirst],
                    placeholderBuilder: (context) =>
                        Image.asset('Assets/poke_ball.png'),
                    width: 40,
                  ),
            title: Text(
                widget.moves == null
                    ? "pokemon.name"
                    : widget.moves.name.capitalizeFirst.replaceAll('-', " "),
                style: AppTextStyle.regular),
          )),
    );
  }
}
