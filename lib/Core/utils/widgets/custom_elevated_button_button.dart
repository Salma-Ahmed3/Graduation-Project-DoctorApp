import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utils/constans.dart';
import 'package:gbsub/Core/utils/style.dart';

class Customelevatedbutton extends StatelessWidget {
  const Customelevatedbutton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width = 250,
    this.height = 50,
  });
  final String text;
  final void Function() onPressed;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: mainColor,
          fixedSize: Size(width!.w, height!.h),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: Styles.style16.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
