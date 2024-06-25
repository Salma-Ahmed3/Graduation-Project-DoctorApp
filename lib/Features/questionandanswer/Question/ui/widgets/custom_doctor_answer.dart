import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gbsub/Core/utils/constans.dart';
import 'package:gbsub/Core/utils/style.dart';
import 'package:gbsub/Features/questionandanswer/asnwer/ui/answer_view.dart';

class CustomDoctorAnswer extends StatelessWidget {
  const CustomDoctorAnswer({
    super.key,
    required this.id,
  });
  final int id;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Text(
              'إجابة السؤال',
              style: Styles.style14.copyWith(color: mainColor),
            ),
            SizedBox(
              width: 20.w,
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return AnswerView(id: id);
                    },
                  ),
                );
              },
              icon: Icon(
                FontAwesomeIcons.arrowLeft,
                size: 20.w,
              ),
              color: mainColor,
            )
          ],
        )
      ],
    );
  }
}
