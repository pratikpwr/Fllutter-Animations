import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class FoodHeading extends StatefulWidget {
  @override
  _FoodHeadingState createState() => _FoodHeadingState();
}

class _FoodHeadingState extends State<FoodHeading>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  // Animation<Offset> _searchOffsetAnimation;
  Animation<Offset> _profileOffsetAnimation;

  @override
  void initState() {
    _controller =
        AnimationController(duration: Duration(milliseconds: 900), vsync: this)
          ..forward();

    // _searchOffsetAnimation = Tween<Offset>(
    //         begin: Offset(1, 0), end: Offset(0, 0))
    //     .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _profileOffsetAnimation =
        Tween<Offset>(begin: Offset(8, 0), end: Offset(0, 0))
            .animate(CurvedAnimation(parent: _controller, curve: Curves.ease));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SlideTransition(
          position: _profileOffsetAnimation,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/userpic.jpg',
              fit: BoxFit.cover,
              height: 40,
              width: 40,
            ),
          ),
        ),
        Icon(FontAwesome.search, size: 26, color: Colors.grey[800]),
      ],
    );
  }
}
