import 'package:flutter/material.dart';
import 'package:flutter_animations/healthy_fruits/colors.dart';
import '../widgets/category.dart';
import '../widgets/heading.dart';
import '../widgets/tabs.dart';
import '../widgets/title.dart';

class FruitsHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.all(18),
        color: MyColors.skinWhite,
        height: MediaQuery.of(context).size.height,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 45, child: FoodHeading()),
            Container(alignment: Alignment.centerLeft, child: FoodTitle()),
            Expanded(
              child: SizedBox(),
            ),
            SizedBox(height: 42, child: FoodCategory()),
            SizedBox(
              height: 26,
            ),
            SizedBox(height: 40, child: FoodTabs())
          ],
        ),
      )),
    );
  }
}
