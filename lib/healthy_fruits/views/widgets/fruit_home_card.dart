import 'package:flutter/material.dart';
import 'package:flutter_animations/healthy_fruits/colors.dart';
import 'package:flutter_animations/healthy_fruits/models/fruits_model.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class FruitHomeCard extends StatefulWidget {
  final FruitModel fruit;
  final Size totalSize;

  FruitHomeCard(this.fruit, this.totalSize);

  @override
  _FruitHomeCardState createState() => _FruitHomeCardState();
}

class _FruitHomeCardState extends State<FruitHomeCard>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _curve;
  Animation<Offset> _offsetAnimation;
  Animation<double> _imageBack;
  Animation<double> _iconSize;

  @override
  void initState() {
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
    return Positioned(
      right: totalSize.width * 0.06,
      bottom: totalSize.height * 0.21,
      child: SlideTransition(
        position: _offsetAnimation,
        child: Stack(
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  height: totalSize.height * 0.54,
                  width: totalSize.width * 0.55,
                  decoration: BoxDecoration(
                      color: MyColors.skin,
                      borderRadius: BorderRadius.circular(35)),
                  child: _buildInformation(),
                ),
                SizedBox(
                  width: totalSize.width * 0.09,
                )
              ],
            ),
            Positioned(
                top: 0,
                left: 0,
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Container(
                      height: _iconSize.value,
                      width: _iconSize.value,
                      decoration: BoxDecoration(
                          color: MyColors.green,
                          borderRadius: BorderRadius.circular(100)),
                      child: IconButton(
                          icon: Icon(FontAwesome.heart,color: Colors.white, size: _iconSize.value * 0.6,), onPressed: () {}),
                    );
                  },
                )),
            Positioned(
              top: 16,
              right: 0,
              child: buildImageAndBack(),
            )
          ],
        ),
      ),
    );
  }

  Stack buildImageAndBack() {
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
                  borderRadius: BorderRadius.circular(100)),
            );
          },
        ),
        Image.asset(
          widget.fruit.image,
          height: widget.totalSize.height * 0.25,
          width: widget.totalSize.height * 0.25,
          fit: BoxFit.cover,
        ),
      ],
    );
  }

  Widget _buildInformation() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SizedBox(),
        ),
        Text(
          widget.fruit.name,
          style: GoogleFonts.poppins(
              color: Colors.grey[900],
              fontSize: 22,
              fontWeight: FontWeight.w600),
        ),
        Text(
          widget.fruit.description,
          maxLines: 6,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.poppins(color: Colors.grey[800], fontSize: 16),
        ),
      ],
    );
  }
}
