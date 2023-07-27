import 'package:alippo_assignment/views/elements/buttons/flat_text_button.dart';
import 'package:flutter/material.dart';

import '../../../../main.dart';
import '../../../constants/app_colors.dart';

class ExitPopup extends StatelessWidget {
  final VoidCallback? onContinue;
  const ExitPopup({Key? key, required this.onContinue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 25,
          ),
          Text(
            'Do you want to close the app?',
            style: TextStyle(
              color: AppColors.blackText,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Divider(
            color: AppColors.blackText,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FlatTextButton(
                  fontWeight: FontWeight.w600,
                  textColor: AppColors.blackText,
                  text: 'Yes',
                  function: onContinue),
              Container(
                height: 30,
                child: VerticalDivider(
                  endIndent: 0,
                  color: Color(0xff3c3c43),
                ),
              ),
              FlatTextButton(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  textColor: AppColors.blackText,
                  text: 'No',
                  function: () {
                    navigatorKey.currentState!.pop();
                  })
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
