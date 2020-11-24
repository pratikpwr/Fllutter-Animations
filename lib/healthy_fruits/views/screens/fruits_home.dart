import 'package:flutter/material.dart';
import 'package:flutter_animations/healthy_fruits/colors.dart';
import 'package:flutter_animations/healthy_fruits/models/fruits_model.dart';
import 'package:flutter_animations/healthy_fruits/views/widgets/fruit_home_card.dart';
import 'package:flutter_animations/healthy_fruits/views/widgets/side_bar.dart';
import '../widgets/category.dart';
import '../widgets/heading.dart';
import '../widgets/tabs.dart';
import '../widgets/title.dart';

class FruitsHome extends StatelessWidget {
  final List<FruitModel> fruits = [
    FruitModel(
        name: 'Dragon Fruit',
        description:
            'The dragon fruit has a dramatic appearance, with bright red, purple or yellow skinned varieties and the prominent scales. The fruit is oval, elliptical or pear-shaped. The flesh has a subtly flavoured sweet taste or sometimes slightly sourish taste. The flesh is either white or red, with edible black seeds dotted all over.',
        price: '6.99',
        isFav: true,
        image: 'assets/dgfruit.png'),
    FruitModel(
        name: 'Figis',
        description:
            'A tender, ripe fig is heavy with its own syrupy liqueur, which tends to drizzle out of its base if you wait too long to eat it. The taste is all honey-like sweetness with a subtle hint of berry and fresher shades of the flavor you might recognize from a certain cookie.',
        price: '9.59',
        isFav: false,
        image: 'assets/figi.png')
  ];

  @override
  Widget build(BuildContext context) {
    final totalSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Container(
        color: MyColors.skinWhite,
        height: totalSize.height,
        child: Stack(
          children: [
            FruitHomeCard(fruits[0], totalSize),
            FruitSideBar(),
            Container(
              margin: EdgeInsets.all(18),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 45, child: FoodHeading()),
                  Container(
                      alignment: Alignment.centerLeft, child: FoodTitle()),
                  Expanded(
                    child: SizedBox(),
                  ),
                  SizedBox(height: 42, child: FoodCategory()),
                  SizedBox(
                    height: 26,
                  ),
                  SizedBox(height: 26, child: FoodTabs())
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
