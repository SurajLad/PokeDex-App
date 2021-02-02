import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:line_icons/line_icons.dart';
import 'package:my_pokedex/Helpers/api_helper.dart';
import 'package:my_pokedex/Helpers/responsive_helper.dart';
import 'package:my_pokedex/Helpers/text_styles.dart';
import 'package:my_pokedex/Model/MovesList.dart';
import 'package:my_pokedex/UI/Moves/TM_Tile.dart';

class MovesList extends StatefulWidget {
  @override
  _MovesListState createState() => _MovesListState();
}

class _MovesListState extends State<MovesList> {
  final PagingController<String, Results> _pagingController =
      PagingController(firstPageKey: "https://pokeapi.co/api/v2/move");

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(String pageKey) async {
    try {
      print(pageKey);
      final newItems = await APIHelper().getMoves(pageKey);
      // final isLastPage = newItems.length < _pageSize;
      if (newItems.next == null) {
        _pagingController.appendLastPage(newItems.results);
      } else {
        final nextPageKey = newItems.next;
        _pagingController.appendPage(newItems.results, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          width: ResponsiveHelper.instance.width,
          height: ResponsiveHelper.instance.height,
          child: Stack(
            children: [
              Positioned(
                left: ResponsiveHelper.instance.width - 160,
                bottom: (ResponsiveHelper.instance.height / 1.45),
                child: Image.asset(
                  'Assets/poke_ball.png',
                  width: 230,
                  height: 230,
                ),
              ),
              Positioned(
                left: 10,
                top: 35,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    LineIcons.arrow_left,
                    color: Color(0xFFe94a41),
                  ),
                  iconSize: 30,
                ),
              ),
              Positioned(
                left: 30,
                top: 45,
                right: 25,
                child: Container(
                  width: ResponsiveHelper.instance.width,
                  height: ResponsiveHelper.instance.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 35.0),
                        child: Text(
                          "Moves",
                          style: AppTextStyle.extraLargeBold.copyWith(
                            color: Color(0xFFe94a41),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Container(
                      //   width: ResponsiveHelper.instance.width,
                      //   height: 40,
                      //   decoration: BoxDecoration(
                      //     color: const Color(0xFFEAEBF5),
                      //     border: Border.all(color: Colors.black12),
                      //     borderRadius: BorderRadius.circular(12),
                      //   ),
                      //   child: TextFormField(
                      //     controller: homeController.filterTxtController,
                      //     onChanged: (value) {
                      //       homeController.onDataSearched();
                      //     },
                      //     decoration: InputDecoration(
                      //       contentPadding: const EdgeInsets.all(4),
                      //       prefixIcon: Icon(
                      //         Icons.search,
                      //         color: Colors.black54,
                      //       ),
                      //       hintText: "Search Pokemon.",
                      //       hintStyle: AppTextStyle.smallBold.copyWith(
                      //         color: Color(0xFF827A7D),
                      //       ),
                      //       border: InputBorder.none,
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(height: 10),
                      Text(
                        "This Pokedex contains detailed stats for every pokemon.",
                        style: AppTextStyle.regularBold.copyWith(
                          color: Color(0xFF827A7D),
                          fontSize: ResponsiveHelper.instance.fontSize - 4,
                        ),
                      ),
                      Expanded(
                          child: PagedListView<String, Results>(
                        pagingController: _pagingController,
                        builderDelegate: PagedChildBuilderDelegate<Results>(
                          itemBuilder: (context, item, index) => TMTile(
                            moves: item,
                          ),
                        ),
                      )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
