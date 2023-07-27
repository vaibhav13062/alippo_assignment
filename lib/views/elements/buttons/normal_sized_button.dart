import 'package:alippo_assignment/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants/dimensional_constants/device_size_config.dart';
import '../../../constants/dimensional_constants/margins.dart';

class NormalSizedButton extends StatelessWidget {
  final String? text;
  final VoidCallback? function;
  final Color? color;
  final Color? loadingColor;
  final Color? textColor;
  final bool? isLoading;
  final double? fontSize;
  final FontWeight? fontWeight;

  const NormalSizedButton(
      {super.key,
      required this.text,
      this.textColor,
      this.fontWeight,
      this.fontSize,
      this.isLoading,
      required this.color,
      required this.function,
      this.loadingColor});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AnimatedContainer(
      height: 55,
      width: isLoading == true ? 57 : DeviceSizeConfig.screenWidth,
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
        borderRadius: isLoading == false
            ? BorderRadius.circular(15)
            : BorderRadius.circular(15),
        color: color,
      ),
      child: isLoading == true
          ? Center(
              child: CircularProgressIndicator(
                color: loadingColor ?? AppColors.mainColor,
              ),
            )
          : Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(15),
              clipBehavior: Clip.hardEdge,
              child: InkWell(

                onTap: function,
                child: Center(
                  child: Text(
                    text!,
                    style: GoogleFonts.manrope(
                      color: AppColors.white,
                      textStyle: TextStyle(
                        fontSize: fontSize ?? 17,
                        fontWeight: fontWeight ?? FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}

// class AuthButton extends StatelessWidget {
//   final VoidCallback? function;
//   final String? imgPath;
//   final String? text;
//   final Color? buttonColor;
//   const AuthButton(
//       {@required this.function,
//       this.buttonColor,
//       @required this.imgPath,
//       @required this.text});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.center,
//       height: 63,
//       margin: EdgeInsets.symmetric(horizontal: 26),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(8),
//           color: buttonColor,
//           border: Border.all(width: 1, color: Color(0xffEBEAEC))),
//       child: GestureDetector(
//         onTap: function,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SvgPicture.asset(imgPath!),
//             Padding(
//               padding: const EdgeInsets.only(left: 26.0),
//               child: Text(
//                 text!.toUpperCase(),
//                 style: TextStyle(
//                     color: buttonColor == AppColors.facebookButtonColor
//                         ? AppColors.white
//                         : AppColors.normalSizedButtonTextGreyColor,
//                     fontFamily: 'Inter',
//                     fontWeight: FontsType.medium,
//                     fontSize: FontSizes.xxSmall),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CustomIconTextButton extends StatelessWidget {
//   final Color? buttonColor;
//   final String? text;
//   final VoidCallback? function;
//   final Widget? icon;
//   final double? fontSize;
//   final FontWeight? fontWeight;
//   final Color? textColor;
//   CustomIconTextButton(
//       {@required this.buttonColor,
//       @required this.function,
//       @required this.icon,
//       @required this.text,
//       this.textColor,
//       this.fontSize,
//       this.fontWeight});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 53,
//       margin: EdgeInsets.symmetric(horizontal: 27),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(8),
//           color: buttonColor,
//           border: Border.all(
//               width: 1, color: AppColors.normalSizedButtonBorderWhiteColor)),
//       child: Material(
//         color: buttonColor,
//         borderRadius: BorderRadius.circular(8),
//         child: InkWell(
//           borderRadius: BorderRadius.circular(8),
//           onTap: function,
//           child: Center(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 icon!,
//                 Padding(
//                   padding: const EdgeInsets.only(left: 11.0),
//                   child: Text(
//                     text!,
//                     style: TextStyle(
//                         color: textColor,
//                         fontFamily: 'Inter',
//                         fontWeight: fontWeight,
//                         fontSize: fontSize),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
