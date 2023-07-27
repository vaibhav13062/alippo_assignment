import 'package:flutter/material.dart';

import '../../../constants/dimensional_constants/margins.dart';

class SmallSizedButton extends StatelessWidget {
  final String? text;
  final VoidCallback? function;
  final Color? color;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? padding;
  SmallSizedButton(
      {required this.text,
      this.textColor,
      this.fontWeight,
      this.fontSize,
      this.color,
      required this.function,
      this.padding});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Margins.buttonBorderRadius!),
        color: color,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Margins.buttonBorderRadius!),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: function,
            child: Container(
              padding: padding ?? EdgeInsets.all(10),
              child: Text(
                text!,
                style: TextStyle(
                    color: textColor,
                    fontFamily: 'Inter',
                    fontWeight: fontWeight,
                    fontSize: fontSize),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
