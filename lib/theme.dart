import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Color primaryColors = Color(0xFF363563);

var spinDancing = SpinKitThreeBounce(color: primaryColors, size: 30);

class TextStyles extends StatelessWidget {
  const TextStyles({
    this.size = 12,
    this.color = Colors.black,
    this.value,
    this.weight,
    Key? key,
  }) : super(key: key);

  final String? value;
  final Color color;
  final FontWeight? weight;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(
      value!,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: weight,
      ),
    );
  }
}
