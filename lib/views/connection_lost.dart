import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../constants/app_colors.dart';
import '../main.dart';
import 'elements/exit_popup/exit_popup.dart';

class ConnectionLost extends StatelessWidget {
  const ConnectionLost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showDialog(
            context: context,
            builder: (builder) {
              return ExitPopup(onContinue: () {
                print('KILL APP');
                exit(0);
              });
            });
        return false;
      },
      child: AnimatedContainer(
        duration: const Duration(seconds: 2),
        decoration: const BoxDecoration(),
        child: Scaffold(
          backgroundColor: AppColors.mainColor,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 200,
                child: Lottie.asset(
                  'assets/lottie/no-internet.json',
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Connection Lost',
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        color: AppColors.whiteText,
                        fontSize: 16,
                        fontWeight: FontWeight.w700)),
              ),
              const SizedBox(
                height: 66,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
