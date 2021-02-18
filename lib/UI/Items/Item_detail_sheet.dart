import 'package:flutter/material.dart';
import 'package:my_pokedex/Helpers/api_helper.dart';
import 'package:my_pokedex/Helpers/responsive_helper.dart';
import 'package:my_pokedex/Helpers/text_styles.dart';
import 'package:my_pokedex/Helpers/utility_helpers.dart';
import 'package:my_pokedex/Model/item_detail.dart';

class ItemDetailSheet extends StatefulWidget {
  final String url;
  ItemDetailSheet({this.url});
  @override
  _ItemDetailSheetState createState() => _ItemDetailSheetState();
}

class _ItemDetailSheetState extends State<ItemDetailSheet> {
  ItemDetail itemDetail;
  String description = "";

  @override
  void initState() {
    getitemDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.8,
      maxChildSize: 1,
      expand: false,
      builder: (context, scrollController) => itemDetail != null
          ? Container(
              margin: const EdgeInsets.only(left: 30, right: 10),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      itemDetail.name.capitalizeFirst.replaceAll('-', " "),
                      style: AppTextStyle.extraLargeBold
                          .copyWith(color: Color(0xFFe94a41)),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      description
                          .replaceAll("\n\n", "\n")
                          .replaceAll("  ", "")
                          .replaceAll(": ", ""),
                      style: AppTextStyle.regularBold.copyWith(
                        color: Color(0xFF827A7D),
                        fontSize: ResponsiveHelper.instance.fontSize - 4,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 30,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: itemDetail.attributes.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: const EdgeInsets.only(right: 12.0),
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                              color: Colors.red[400],
                              borderRadius: BorderRadius.circular(6),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              itemDetail.attributes[index].name
                                  .replaceAll("-", " ")
                                  .capitalizeFirst,
                              style: AppTextStyle.smallBold
                                  .copyWith(color: Colors.white),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    buildAboutInformation(
                        "Category",
                        itemDetail.category.name.capitalizeFirst
                            .replaceAll("-", " ")),
                    const SizedBox(height: 8),
                    buildAboutInformation("Cost", itemDetail.cost.toString()),
                    const SizedBox(height: 8),
                    buildAboutInformation(
                        "Fling Effect", itemDetail.flingEffect ?? "N/A"),
                    const SizedBox(height: 8),
                    buildAboutInformation(
                        "Fling Power",
                        itemDetail.flingPower != null
                            ? itemDetail.flingPower.toString()
                            : "N/A"),
                  ],
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(top: 18.0, bottom: 18.0),
              child: Image.asset(
                'Assets/loading.gif',
                height: 140,
              ),
            ),
    );
  }

  void getitemDetails() async {
    itemDetail = await APIHelper().geitemDetail(widget.url);
    itemDetail.effectEntries.forEach((element) {
      element.language.name == "en"
          ? description = element.effect
          : description = "";
    });
    setState(() {});
  }
}
