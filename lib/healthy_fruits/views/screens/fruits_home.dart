import 'package:flutter/material.dart';
import 'package:flutter_animations/healthy_fruits/colors.dart';
import 'package:flutter_animations/healthy_fruits/views/widgets/fruit_slider.dart';
import 'package:flutter_animations/healthy_fruits/views/widgets/side_bar.dart';
import '../widgets/category.dart';
import '../widgets/heading.dart';
import '../widgets/tabs.dart';
import '../widgets/title.dart';

class FruitsHome extends StatelessWidget {
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
            FruitSlider(),
            FruitSideBar(),
            Container(
              margin: EdgeInsets.all(18),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      height: totalSize.height * 0.06, child: FoodHeading()),
                  Container(
                      alignment: Alignment.centerLeft, child: FoodTitle()),
                  Expanded(
                    child: SizedBox(),
                  ),
                  SizedBox(
                      height: totalSize.height * 0.06, child: FoodCategory()),
                  SizedBox(
                    height: totalSize.height * 0.038,
                  ),
                  SizedBox(height: totalSize.height * 0.038, child: FoodTabs())
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
