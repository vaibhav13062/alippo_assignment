import 'package:alippo_assignment/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants/dimensional_constants/device_size_config.dart';
import '../../../constants/dimensional_constants/margins.dart';

class MediumSizedButton extends StatelessWidget {
  final String? text;
  final Color? textColor;
  final bool? isIconButton;
  final VoidCallback? function;
  final Color? color;
  final EdgeInsets? margin;
  final String? imagePath;
  final Color? borderColor;
  MediumSizedButton(
      {required this.text,
      this.borderColor,
      required this.isIconButton,
      required this.function,
      required this.color,
      required this.margin,
      this.imagePath,
      this.textColor});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: isIconButton == false
          ? Container(
              alignment: Alignment.center,
              height: 50,
              width: 366,
              margin: margin,
              decoration: BoxDecoration(
                border: Border.all(
                    color: borderColor == null ? AppColors.white : borderColor!,
                    width: borderColor == null ? 0 : 1),
                borderRadius: BorderRadius.circular(6),
                color: color,
              ),
              child: Text(
                text!,
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 14)),
              ),
            )
          : Container(
              alignment: Alignment.center,
              height: 50,
              width: 366,
              margin: margin,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: color,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.contain, image: AssetImage(imagePath!)),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    text!,
                    style: GoogleFonts.montserrat(textStyle: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14)),
                  ),
                ],
              )),
    );
  }
}
