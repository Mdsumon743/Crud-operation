import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String tittle;
  final double size;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final int? maxline;

  const CustomText(
      {super.key,
      required this.tittle,
      required this.size,
      required this.fontWeight,
      required this.color,
      this.textAlign,
      this.maxline,
      this.textOverflow});

  @override
  Widget build(BuildContext context) {
    return Text(
      tittle,
      maxLines: maxline,
      textAlign: textAlign,
      style: TextStyle(
        overflow: textOverflow,
        color: color,
        fontWeight: fontWeight,
        fontSize: size,
      ),
    );
  }
}
