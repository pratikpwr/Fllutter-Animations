import 'package:flutter/material.dart';
import 'package:flutter_animations/healthy_fruits/colors.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodTabs extends StatefulWidget {
  @override
  _FoodTabsState createState() => _FoodTabsState();
}

class _FoodTabsState extends State<FoodTabs>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _curve;
  Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    _controller =
        AnimationController(duration: Duration(milliseconds: 900), vsync: this)
          ..forward();

    _curve = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _offsetAnimation = TweenSequence(<TweenSequenceItem<Offset>>[
      TweenSequenceItem(
          tween: Tween<Offset>(begin: Offset(1, 0), end: Offset(-0.2, 0)),
          weight: 50),
      TweenSequenceItem(
          tween: Tween<Offset>(begin: Offset(-0.2, 0), end: Offset(0, 0)),
          weight: 50)
    ]).animate(_curve);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            Feather.home,
            size: 30,
            color: MyColors.green,
          ),
          Icon(
            Feather.heart,
            size: 30,
            color: Colors.grey,
          ),
          Icon(
            Feather.shopping_bag,
            size: 30,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
