import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:gbsub/Features/questionandanswer/Question/repos/question_repo.dart';

part 'answer_question_state.dart';

class AnswerQuestionCubit extends Cubit<AnswerQuestionState> {
  AnswerQuestionCubit(this.questionAndAnswerRepo, this.id)
      : super(AnswerInitialStates());

  final QuestionAndAnswerRepo questionAndAnswerRepo;
  String content = '';
  final int id;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formkey = GlobalKey();

  Future<void> addAnswerQustion(
      {required int questionId,
      required int doctorId,
      required String content}) async {
    emit(AnswerLoadingStates());
    var result = await questionAndAnswerRepo.addAnswerQustion(
        questionId: questionId, doctorId: doctorId, content: content);
    result.fold((failure) {
      emit(AnswerFailureStates(failure.errMessage));
    }, (answerModel) {
      emit(AnswerSuccessStates(answerModel));
    });
  }

  void enterAnswer(String value) {
    content = value;
    emit(AnswerChangedStates());
  }
}
