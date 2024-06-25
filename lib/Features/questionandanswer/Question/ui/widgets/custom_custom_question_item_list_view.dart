import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/cubits/bottomnavigationbarcubit/MainCubi.dart';
import 'package:gbsub/Core/cubits/bottomnavigationbarcubit/MainStates.dart';

import 'package:gbsub/Features/questionandanswer/Question/ui/widgets/custom_question_element.dart';

class CustomListViewQuestionElement extends StatelessWidget {
  const CustomListViewQuestionElement({
    super.key,
    required this.of,
  });
  final MainCubit of;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, mainStates>(
      builder: (context, state) {
        return ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return CustomQuestionElement(
              content: of.questions[index].question.content,
              gender: of.questions[index].user.gender,
              answered: of.questions[index].question.answered,
              id: of.questions[index].question.id,
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 5.h,
            );
          },
          itemCount: of.questions.length,
        );
      },
    );
  }
}
