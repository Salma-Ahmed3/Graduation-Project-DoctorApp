import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Core/services/api_services.dart';
import 'package:gbsub/Features/questionandanswer/Question/repos/question_repo_impl.dart';
import 'package:gbsub/Features/questionandanswer/Question/ui/widgets/add_answer_question_view_body.dart';
import 'package:gbsub/Features/questionandanswer/asnwer/logic/answer_qustion/answer_question_cubit.dart';

class AddAnswerQuestionView extends StatelessWidget {
  const AddAnswerQuestionView({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: BlocProvider(
            create: (context) => AnswerQuestionCubit(
                QuestionAndAnswerRepoImpl(
                  apiService: ApiService(
                    Dio(),
                  ),
                ),
                id),
            child: const Scaffold(
              body: AddAnswerQuestionViewBody(),
            ),
          ),
        ),
      ),
    );
  }
}
