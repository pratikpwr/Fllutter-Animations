import 'package:flutter/material.dart';
import 'package:flutter_animations/healthy_fruits/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class FruitSideBar extends StatefulWidget {
  @override
  _FruitSideBarState createState() => _FruitSideBarState();
}

class _FruitSideBarState extends State<FruitSideBar>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _curve;
  Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    _controller =
        AnimationController(duration: Duration(milliseconds: 900), vsync: this)
          ..forward();

    _curve = CurvedAnimation(parent: _controller, curve: Curves.easeInExpo);

    _offsetAnimation =
        Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0)).animate(_curve);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final totalSize = MediaQuery.of(context).size;
    return SlideTransition(
      position: _offsetAnimation,
      child: Container(
        height: totalSize.height * 0.7,
        width: totalSize.width * 0.18,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(45))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: totalSize.height * 0.15,
            ),
            RotatedBox(
              quarterTurns: 3,
              child: Text(
                'All Fruits',
                style:
                    GoogleFonts.poppins(color: Colors.grey[600], fontSize: 16),
              ),
            ),
            RotatedBox(
              quarterTurns: 3,
              child: Text(
                'Popular',
                style:
                    GoogleFonts.poppins(color: Colors.grey[600], fontSize: 16),
              ),
            ),
            RotatedBox(
              quarterTurns: 3,
              child: Text(
                'Newest',
                style: GoogleFonts.poppins(color: MyColors.red, fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}
