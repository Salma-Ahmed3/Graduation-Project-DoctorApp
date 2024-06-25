import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utils/constans.dart';
import 'package:gbsub/Core/utils/style.dart';
import 'package:gbsub/Features/questionandanswer/asnwer/logic/answer/answer_cubit.dart';
import 'package:gbsub/Features/questionandanswer/asnwer/ui/custom.doctor_info.dart';
import 'package:gbsub/Features/questionandanswer/asnwer/ui/custom_content_element.dart';
import 'package:gbsub/Features/questionandanswer/asnwer/ui/custom_image_element.dart';

class AnswerViewBody extends StatelessWidget {
  const AnswerViewBody({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: BlocProvider.of<AnswerCubit>(context).getANswerForQuestion(id),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: mainColor,
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          var of = BlocProvider.of<AnswerCubit>(context);
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: mainColor.withOpacity(
                      0.3,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(16.w)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomImageElement(
                      image: '$imageUrl${of.answerModel.doctor.doctorPic}',
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    CustomDoctorInfo(
                      doctorName: of.answerModel.doctor.doctorName,
                      spec: of.answerModel.speciality.spec,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: CustomContentElement(
                    content: of.answerModel.answer.content,
                  ),
                ),
              ],
            ),
          );
        } else {
          return Center(
            child: Text(
              'تأكد من الأتصال بالانترنت',
              style: Styles.styleBold24.copyWith(color: mainColor),
            ),
          );
        }
      },
    );
  }
}
