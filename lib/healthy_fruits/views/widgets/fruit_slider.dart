import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter_animations/healthy_fruits/models/fruits_model.dart';
import 'package:flutter_animations/healthy_fruits/views/widgets/fruit_slider_card.dart';

class FruitSlider extends StatelessWidget {
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
        image: 'assets/figi.png'),
    FruitModel(
        name: 'Pomegranate',
        image: 'assets/pomo.png',
        description:
            'The fruit is the size of a large orange, obscurely six-sided, with a smooth leathery skin that ranges from brownish yellow to red; within, it is divided into several chambers containing many thin transparent arils of reddish, juicy pulp, each surrounding an angular elongated seed.',
        price: '8.59',
        isFav: true),
    FruitModel(
        name: 'Papaya',
        description:
            'The papaya is a small, sparsely branched tree, usually with a single stem growing from 5 to 10 m (16 to 33 ft) tall, with spirally arranged leaves confined to the top of the trunk. The lower trunk is conspicuously scarred where leaves and fruit were borne.Papayas are delicious.',
        price: '6.99',
        isFav: false,
        image: 'assets/papai.png')
  ];

  @override
  Widget build(BuildContext context) {
    final totalSize = MediaQuery.of(context).size;
    return Positioned(
        right: totalSize.width * 0.0,
        bottom: totalSize.height * 0.21,
        child: Container(
          height: totalSize.height * 0.54,
          width: totalSize.width,
          child: CarouselSlider(
              options: CarouselOptions(
                  height: totalSize.height * 0.54,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.65,
                  initialPage: 0,
                  enableInfiniteScroll: false,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                  scrollPhysics: BouncingScrollPhysics()),
              items: fruits.map((_fruit) {
                return Builder(
                  builder: (context) {
                    return FruitSliderCard(_fruit, totalSize);
                  },
                );
              }).toList()),
        ));
  }
}
