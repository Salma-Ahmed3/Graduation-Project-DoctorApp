part of 'answer_question_cubit.dart';

abstract class AnswerQuestionState {}

class AnswerInitialStates extends AnswerQuestionState {}

class AnswerChangedStates extends AnswerQuestionState {}

class AnswerSuccessStates extends AnswerQuestionState {
  final bool answer;

  AnswerSuccessStates(this.answer);
}

class AnswerFailureStates extends AnswerQuestionState {
  final String errMessege;

  AnswerFailureStates(this.errMessege);
}

class AnswerLoadingStates extends AnswerQuestionState {}
