import 'package:flutter/material.dart';
import 'package:flutter_animations/healthy_fruits/colors.dart';
import 'package:flutter_animations/healthy_fruits/models/fruits_model.dart';
import 'package:flutter_animations/healthy_fruits/views/screens/fruit_detail_screen.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class FruitSliderCard extends StatefulWidget {
  final FruitModel fruit;
  final Size totalSize;

  FruitSliderCard(this.fruit, this.totalSize);

  @override
  _FruitSliderCardState createState() => _FruitSliderCardState();
}

class _FruitSliderCardState extends State<FruitSliderCard>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _curve;
  Animation<Offset> _offsetAnimation;
  Animation<double> _imageBack;
  Animation<double> _iconSize;

  @override
  void initState() {
    animate();
    super.initState();
  }

  void animate() {
    _controller =
        AnimationController(duration: Duration(milliseconds: 900), vsync: this)
          ..forward();

    _curve = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _offsetAnimation = TweenSequence(<TweenSequenceItem<Offset>>[
      TweenSequenceItem(
          tween: Tween<Offset>(begin: Offset(1, 0), end: Offset(-0.4, 0)),
          weight: 50),
      TweenSequenceItem(
          tween: Tween<Offset>(begin: Offset(-0.4, 0), end: Offset(0, 0)),
          weight: 50)
    ]).animate(_curve);

    _imageBack = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem(
          tween: Tween<double>(begin: 0, end: widget.totalSize.height * 0.27),
          weight: 50),
      TweenSequenceItem(
          tween: Tween<double>(
              begin: widget.totalSize.height * 0.27,
              end: widget.totalSize.height * 0.25),
          weight: 50)
    ]).animate(_curve);

    _iconSize = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem(tween: Tween<double>(begin: 0, end: 54), weight: 50),
      TweenSequenceItem(tween: Tween<double>(begin: 54, end: 42), weight: 50)
    ]).animate(_curve);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final totalSize = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (ctx) {
          return FruitDetailScreen(widget.fruit);
        }));
      },
      child: SlideTransition(
        position: _offsetAnimation,
        child: Container(
          height: totalSize.height * 0.54,
          width: totalSize.width * 0.66,
          child: Row(
            children: [
              SizedBox(
                width: totalSize.width * 0.05,
              ),
              Stack(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: totalSize.width * 0.03,
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        height: totalSize.height * 0.54,
                        width: totalSize.width * 0.54,
                        decoration: BoxDecoration(
                            color: MyColors.skin,
                            borderRadius: BorderRadius.circular(35)),
                        child: _buildInformation(widget.fruit),
                      ),
                      SizedBox(
                        width: totalSize.width * 0.03,
                      )
                    ],
                  ),
                  Positioned(
                      top: 0, left: 0, child: buildLikeButton(widget.fruit)),
                  Positioned(
                    top: 16,
                    right: 0,
                    child: buildImageAndBack(widget.fruit),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  AnimatedBuilder buildLikeButton(FruitModel fruit) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          height: _iconSize.value,
          width: _iconSize.value,
          decoration: BoxDecoration(
              color: MyColors.green, borderRadius: BorderRadius.circular(100)),
          child: IconButton(
              icon: Icon(
                fruit.isFav ? FontAwesome.heart : FontAwesome.heart_o,
                color: Colors.white,
                size: _iconSize.value * 0.6,
              ),
              onPressed: () {
              }),
        );
      },
    );
  }

  Stack buildImageAndBack(FruitModel fruit) {
    return Stack(
      children: [
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Container(
              height: _imageBack.value,
              width: _imageBack.value,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(4, 1))
                  ],
                  borderRadius: BorderRadius.circular(100)),
            );
          },
        ),
        Hero(
          tag: fruit.name,
          child: Image.asset(
            fruit.image,
            height: widget.totalSize.height * 0.25,
            width: widget.totalSize.height * 0.25,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }

  Widget _buildInformation(FruitModel fruit) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SizedBox(),
        ),
        Text(
          fruit.name,
          style: GoogleFonts.poppins(
              color: Colors.grey[900],
              fontSize: 22,
              fontWeight: FontWeight.w600),
        ),
        Text(
          fruit.description,
          maxLines: 6,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.poppins(color: Colors.grey[800], fontSize: 16),
        ),
      ],
    );
  }
}
