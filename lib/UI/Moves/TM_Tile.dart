import 'package:flutter/material.dart';
import 'package:my_pokedex/Helpers/text_styles.dart';
import 'package:my_pokedex/Model/MovesList.dart';
import 'package:my_pokedex/Model/moves.dart';

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
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(bottom: 8.0),
        height: 80,
        decoration: BoxDecoration(
          //   border: Border.all(color: Colors.black38),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: SizedBox(
                  width: 90,
                  height: 90,
                  child: Image.asset('Assets/poke_ball.png')),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 110.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.moves == null ? "pokemon.name" : widget.moves.name,
                    style:
                        AppTextStyle.regularBold.copyWith(color: Colors.black),
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0, bottom: 2),
                child: Text(
                  "#",
                  style: AppTextStyle.largeBold.copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
