import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants/dimensional_constants/margins.dart';
class FlatTextButton extends StatelessWidget {
  final String? text;
  final VoidCallback? function;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  FlatTextButton(
      {@required this.text,
      this.fontSize,
      this.fontWeight,
      this.textColor,
      @required this.function});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
        borderRadius: BorderRadius.circular(Margins.buttonBorderRadius!),
        onTap: function,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            text!,
            style: GoogleFonts.manrope(textStyle: TextStyle(
                color: textColor,
                fontWeight: fontWeight,
                fontSize: fontSize)),
          ),
        ));
  }
}
