import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Core/services/api_services.dart';
import 'package:gbsub/Features/questionandanswer/Question/repos/question_repo_impl.dart';
import 'package:gbsub/Features/questionandanswer/asnwer/logic/answer/answer_cubit.dart';
import 'package:gbsub/Features/questionandanswer/asnwer/ui/CustomAppbar.dart';
import 'package:gbsub/Features/questionandanswer/asnwer/ui/answer_view_body.dart';

class AnswerView extends StatelessWidget {
  const AnswerView({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AnswerCubit(
        QuestionAndAnswerRepoImpl(apiService: ApiService(Dio())),
      ),
      child: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: const CustomAppbar(title: 'الإجابة'),
            body: AnswerViewBody(
              id: id,
            ),
          ),
        ),
      ),
    );
  }
}
