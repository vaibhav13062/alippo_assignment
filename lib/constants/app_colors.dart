import 'package:flutter/material.dart';

class AppColors {
  static const Color shimmerColor = Color.fromARGB(218, 255, 161, 121);
  static const Color mainColor = Color(0xffffffff);
  static const Color themecolor = Color(0xff1EA896);
  static const Color white = Color(0xfff6f1fb);
  static const Color smokeColor = Color(0xff7000FF);
  static const Color drinkColor = Color(0xffFFD559);
  static const Color lightGrey = Color(0xff9c9c9c);
  static const Color darkGrey = Color(0xff9c9c9c);
  static const Color grey1 = Color(0xff7E8389);
  static const Color containerGrey = Color(0xffF5F5F5);
  static const Color dark = Color(0xff9c9c9c);
  static const Color textFieldColor = Color(0xff404546);
  static const Color blackSecond = Color(0xff222222);
  static const Color blackText = Color(0xff000000);
  static const Color blackIcon = Color(0xff000000);
  static const Color blackButton = Color(0xff171717);
  static const Color whiteText = Color(0xffffffff);
  static const Color backgroundColor = Color(0xffffffff);
  static const Color dividerColor = Color(0xff3C3C43);

  static const Color graph1 = Color(0xff1EA896);
  static const Color graph2 = Color(0xff92C5BC);
  static const Color graph3 = Color(0xff335A6C);
  static const Color graph4 = Color(0xffb6fff3);

  static const Color pink = Color(0xFFE00A97);
  static const Color red = Color(0xFFE70C0C);
  static const Color blue = Color(0xFF1E1EFA);
  static const Color green = Color(0xFF06AA01);
  static const Color yellow = Color(0xFFFFE813);

  static const Color dropDownMenuColor = Color(0xff363636);

  static const Color blue2 = Color(0xff1e8cf2);
  static const Color greyText = Color(0xff6C6C6C);

  static const Color grey = Color(0xff8E8E8E);
  static const Color normalSizedButtonBorderWhiteColor = Color(0xffEBEAEC);
  static const Color normalSizedButtonTextGreyColor = Color(0xff3F414E);
  static const Color blue3 = Color(0xff2196f3);
  static const Color dark_grey2 = Color(0xff31373A);
  static const Color customTextFieldFillLightGreyColor = Color(0xaaF2F3F7);
  static const Color grey2 = Color(0xffCDCDCD);
  static const Color customTextFieldHintTextLightGreyColor = Color(0xffACADAF);
  static const Color safetyMeasuresContainerSubtitleGreyColor =
      Color(0xff7e7e7e);
  static const Color lineGrey = Color(0xffe1e1e1);

  //Order Confirmation Page Colors
  static const Color closeIconButtonColor = Color(0xff5F5F5F);
  static const Color viewBookingButtonBorderColor = Color(0xffACACAC);
  static const Color shadowColor = Color(0x1A000000);
  static Color shadowWhite = const Color(0xffc7c7c7).withOpacity(0.30);
  static Color shadowDark = const Color(0xff000000).withOpacity(0.09);

  static const Color orderPlacedBlockTextColor = Color(0xff212529);
  static const Color red2 = Color(0xffF4511F);
  static const Color lightRed = Color(0xffF3C8C8);
  static const Color greyDividerColor = Color(0xffE8E8E8);
  static const Color orderPlacedContainerColor = Color(0x4F4CD964);
  static const Color orderPlacedTextColor = Color(0xff00D023);
  static const Color scheduleContainerColor = Color(0x4FC9CAC9);
  static const Color blockSeparatorColor = Color(0xffF4F4F4);

  static const Color ratingIconYellowColor = Color(0xffFFC700);

  static const Color red3 = Color(0xffFF525D);
  static const Color lightBlue = Color(0xffDBEDFD);

  static const Color grey3 = Color(0xff7A7A7A);

  static const Color grey4 = Color(0xff686868);
  static const Color ratingIconGreyColor = Color(0xffC4C4C4);
  static const Color focusBorderColor = Color(0x5C000000);
  static const Color grey5 = Color(0xff4A4A4A);

  static const Color lightBlue2 = Color(0xffDAEFFF);
  static const Color blackText2 = Color(0xC4000000);

  static const Color blue4 = Color(0xff3498DB);

  static const Color lightRed2 = Color(0x4FD94C4C);

  static const Color lightGreen = Color(0x4F4CD964);
  static const Color green2 = Color(0xff00D023);

  static const Color lightBlue3 = Color(0x291E8CF2);
  static const Color grey6 = Color(0xff282828);
  static const Color lineGrey2 = Color(0xff878787);
  static const Color blue5 = Color(0xff2699FB);
  static const Color ratingIconGreyColor2 = Color(0xffBDBDBD);

  // Quotation Screen and Questionnaire Screen Colors
  static const Color green3 = Color(0xff4CD964);
  static const Color grey7 = Color(0xffC9C9C9);
  static const Color darkGrey4 = Color(0xff424242);
  static const Color grey8 = Color(0xffCCCCCC);

  // Profile Screen Colors
  static const Color red4 = Color(0xffCF1010);

  static const Color grey9 = Color(0xff797979);
  static const Color grey10 = Color(0xff585858);
  static const Color lightOrange = Color(0xffFFF1E4);
  static const Color lightOrange2 = Color(0x80FFE3D8);
  static const Color light_grey2 = Color(0xffF3F3F3);
  static const Color grey11 = Color(0xff606060);
  static const Color lightOrange3 = Color(0x24F16227);
  static const Color grey12 = Color(0xff828282);
  static const Color lightOrange4 = Color(0xffFFE3D8);
  MaterialColor materialColor = const MaterialColor(
    0xff1EA896,
    <int, Color>{
      50: AppColors.themecolor,
      100:  AppColors.themecolor,
      200: AppColors.themecolor,
      300:  AppColors.themecolor,
      400:  AppColors.themecolor,
      500: AppColors.themecolor,
      600:  AppColors.themecolor,
      700:  AppColors.themecolor,
      800: AppColors.themecolor,
      900: AppColors.themecolor,
    },
  );

}

//Gradient Colors for App
class GradientColors {
  static const List<Color> splashScreenGradient = [
    Color(0xffffffff),
    Color(0xffeef5ff),
    Color(0xffd1e1f9),
    Color(0xff98b8e8),
  ];

  static const List<Color> loginSignupGradient = [
    AppColors.white,
    Color(0xffd1e1f9),
    AppColors.mainColor
  ];

  static const List<Color> connectionLostGradient = [
    Color.fromARGB(255, 255, 255, 255),
    Color.fromARGB(255, 255, 232, 232),
    Color.fromARGB(255, 255, 229, 218),
    Color.fromARGB(255, 255, 239, 229)
  ];
}

// Linear Gradient Colors Shader for Rewards Screen (Code)
final Shader linearGradient = LinearGradient(
  colors: <Color>[
    Color(0xffF45C8D),
    Color(0xffFCA232),
  ],
).createShader(
  Rect.fromLTWH(100.0, 100.0, 200.0, 100.0),
);
