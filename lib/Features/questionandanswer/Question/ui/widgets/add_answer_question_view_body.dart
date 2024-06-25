import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Features/questionandanswer/Question/ui/widgets/custom_add_answer.dart';
import 'package:gbsub/Features/questionandanswer/Question/ui/widgets/custom_answer_question.dart';
import 'package:gbsub/Features/questionandanswer/asnwer/logic/answer_qustion/answer_question_cubit.dart';

class AddAnswerQuestionViewBody extends StatelessWidget {
  const AddAnswerQuestionViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnswerQuestionCubit, AnswerQuestionState>(
      builder: (context, state) {
        return Form(
          key: BlocProvider.of<AnswerQuestionCubit>(context).formkey,
          autovalidateMode:
              BlocProvider.of<AnswerQuestionCubit>(context).autovalidateMode,
          child: const CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: AddAnswer(),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: CustomButtonSend(),
              )
            ],
          ),
        );
      },
    );
  }
}
