import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gbsub/Core/cubits/bottomnavigationbarcubit/MainCubi.dart';
import 'package:gbsub/Core/utils/constans.dart';
import 'package:gbsub/Core/utils/style.dart';
import 'package:gbsub/Features/questionandanswer/Question/ui/widgets/custom_custom_question_item_list_view.dart';

class QuestionAndAnswerViewBody extends StatelessWidget {
  const QuestionAndAnswerViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    var of = BlocProvider.of<MainCubit>(context);
    return FutureBuilder(
      future: of.getQuetions(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: mainColor,
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          return SafeArea(
            child: of.questions.isNotEmpty
                ? CustomListViewQuestionElement(of: of)
                : Center(
                    child: Column(
                      children: [
                        Icon(
                          FontAwesomeIcons.boxOpen,
                          color: Colors.grey,
                          size: 40.w,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          'لا يوجد أي أسئلة في الوقت الحالي ',
                          style: Styles.style16.copyWith(color: Colors.grey),
                        )
                      ],
                    ),
                  ),
          );
        } else {
          return Center(
            child: Text(
              "تأكد من الأتصال بالأنترنت",
              style: Styles.style16.copyWith(color: mainColor),
            ),
          );
        }
      },
    );
  }
}
