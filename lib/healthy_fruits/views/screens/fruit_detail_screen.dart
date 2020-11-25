import 'package:flutter/material.dart';
import 'package:flutter_animations/healthy_fruits/colors.dart';
import 'package:flutter_animations/healthy_fruits/models/fruits_model.dart';

class FruitDetailScreen extends StatelessWidget {
  final FruitModel fruit;

  FruitDetailScreen(this.fruit);

  @override
  Widget build(BuildContext context) {
    final totalSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: MyColors.skinWhite,
        height: totalSize.height,
        child: Column(
          children: [
            Center(
                child: Container(
              height: totalSize.height * 0.4,
              child: Hero(
                  tag: fruit.name,
                  child: Image.asset(
                    fruit.image,
                    fit: BoxFit.cover,
                  )),
            )),
            Stack(
              children: [
                Container(
                  height: totalSize.height * 0.6,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(55),
                          topRight: Radius.circular(55))),
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(),
                      )
                    ],
                  ),
                ),
                Container(
                  height: totalSize.height * 0.2,
                  decoration: BoxDecoration(
                      color: MyColors.green,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(55),
                          topRight: Radius.circular(55))),
                  child: Column(

                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
