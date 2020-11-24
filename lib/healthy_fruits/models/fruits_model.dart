import 'package:flutter/foundation.dart';

class FruitModel {
  final String name;
  final String description;
  final String price;
  final bool isFav;
  final String image;

  const FruitModel({
    @required this.name,
    @required this.description,
    @required this.price,
    @required this.isFav,
    @required this.image,
  });
}
