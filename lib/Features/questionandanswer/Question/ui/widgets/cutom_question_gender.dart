import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utils/constans.dart';
import 'package:gbsub/Core/utils/style.dart';

class CustomQuestionGender extends StatelessWidget {
  const CustomQuestionGender({
    super.key,
    required this.gender,
  });
  final String gender;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'سؤال من :',
          style: Styles.style16,
        ),
        SizedBox(
          width: 5.w,
        ),
        Text(
          gender,
          style: Styles.style16.copyWith(color: mainColor),
        )
      ],
    );
  }
}
