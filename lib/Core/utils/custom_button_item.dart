import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utils/constans.dart';
import 'package:gbsub/Core/utils/style.dart';

class CustomButtonItem extends StatelessWidget {
  const CustomButtonItem({
    super.key,
    required this.text,
    required this.textcolor,
    required this.buttonColor,
    this.onPressed,
  });
  final String text;
  final Color textcolor;
  final Color buttonColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        side: BorderSide(color: mainColor),
        minimumSize: Size(60.w, 35.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: Styles.style13.copyWith(
          color: textcolor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
