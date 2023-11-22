import 'package:flutter/material.dart';
class Barricade extends StatelessWidget {

  final double barricadeX;
  final double barricadeY;
  final double barricadeWidth;
  final double barricadeHeight;

  Barricade({
    required this.barricadeX,
    required this.barricadeY,
    required this.barricadeWidth,
    required this.barricadeHeight,
});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment((2 * barricadeX + barricadeWidth) / (2 - barricadeWidth),
          (2 * barricadeY + barricadeHeight) / (2 - barricadeHeight)),
      child: Container(
        height: MediaQuery.of(context).size.height * 2 / 3 * barricadeHeight / 2,
        width: MediaQuery.of(context).size.width * barricadeWidth / 2,
        child: Image.asset('lib/photos/barricade.png',
          fit: BoxFit.fill,),
      ),
    );
  }
}
