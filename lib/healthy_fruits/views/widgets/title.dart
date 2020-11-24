import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 1000),
      curve: Curves.easeIn,
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, _val, child) {
        return Opacity(
            opacity: _val,
            child: Padding(
              padding: EdgeInsets.only(
                top: _val * 18,
              ),
              child: child,
            ));
      },
      child: Text(
        'Healthy Food Delivery',
        style: GoogleFonts.poppins(fontSize: 24),
      ),
    );
  }
}
