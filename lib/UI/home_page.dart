import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_pokedex/Controllers/home_controller.dart';
import 'package:my_pokedex/UI/pokemon_list.dart';
import 'package:my_pokedex/Widgets/ImageButton.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEAEBF5),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: Get.width,
              height: Get.height / 1.4,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: Get.width - 160,
                    bottom: (Get.height / 2.25),
                    child: Image.asset(
                      'Assets/poke_ball.png',
                      width: 230,
                      height: 230,
                    ),
                  ),
                  Positioned(
                    left: 35,
                    top: 80,
                    right: 25,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Hey Trainer,",
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Which pokemon\nyou are looking for?",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Container(
                          width: Get.width,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Color(0xFFEAEBF5),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(4),
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.black54,
                              ),
                              hintText: "Search Pokemon.",
                              hintStyle: TextStyle(),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            ImageButton(
                              title: "Pokedex",
                              color: Color(0xFF36996D).withOpacity(0.8),
                              function: () {
                                Get.to(PokeDexList());
                              },
                            ),
                            const SizedBox(width: 15),
                            ImageButton(
                              title: "Moves",
                              color: Color(0xFFC73B37).withOpacity(0.8),
                              function: () {},
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            ImageButton(
                              title: "Abilities",
                              color: Color(0xFF2E6DD5).withOpacity(0.8),
                              function: () {},
                            ),
                            const SizedBox(width: 15),
                            ImageButton(
                              title: "Items",
                              color: Color(0xFFEDA926).withOpacity(0.8),
                              function: () {},
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            ImageButton(
                              title: "Locations ",
                              color: Color(0xFF4F1091),
                              function: () {},
                            ),
                            const SizedBox(width: 15),
                            ImageButton(
                              title: "Type",
                              color: Color(0xFF4C2E3C),
                              function: () {},
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "News",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Container(
                    height: 200,
                    child: GetBuilder<HomeController>(builder: (_) {
                      return _.news == null
                          ? SizedBox(
                              width: 40,
                              height: 40,
                              child: CircularProgressIndicator(),
                            )
                          : ListView.builder(
                              itemCount: _.news.articles.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ListTile(
                                  title: Text(_.news.articles[index].title),
                                );
                              },
                            );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
