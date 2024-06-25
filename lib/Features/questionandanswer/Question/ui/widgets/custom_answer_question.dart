import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/cubits/bottomnavigationbarcubit/MainCubi.dart';
import 'package:gbsub/Core/services/sharedpref.dart';
import 'package:gbsub/Core/utils/constans.dart';
import 'package:gbsub/Features/questionandanswer/asnwer/logic/answer_qustion/answer_question_cubit.dart';

class CustomButtonSend extends StatelessWidget {
  const CustomButtonSend({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Spacer(),
      ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: mainColor),
        onPressed: () async {
          if (BlocProvider.of<AnswerQuestionCubit>(context)
              .formkey
              .currentState!
              .validate()) {
            await BlocProvider.of<AnswerQuestionCubit>(context)
                .addAnswerQustion(
              questionId: BlocProvider.of<AnswerQuestionCubit>(context).id,
              doctorId: Sharedhelper.getintdata(intkey),
              content: BlocProvider.of<AnswerQuestionCubit>(context).content,
            );
            Navigator.pop(context);
            await BlocProvider.of<MainCubit>(context).getQuetions();
          } else {
            BlocProvider.of<AnswerQuestionCubit>(context).autovalidateMode =
                AutovalidateMode.always;
          }
        },
        child: Text(
          "نشر",
          style: TextStyle(color: Colors.white, fontSize: 23.sp),
        ),
      ),
      SizedBox(
        height: 10.h,
      )
    ]);
  }
}
