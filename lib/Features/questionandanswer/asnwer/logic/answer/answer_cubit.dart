import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Core/utils/constans.dart';
import 'package:gbsub/Features/questionandanswer/asnwer/data/answer_model.dart';
import 'package:gbsub/Features/questionandanswer/asnwer/logic/answer/answer_states.dart';

class AnswerCubit extends Cubit<AnswerStates> {
  AnswerCubit(questionAndAnswerRepoImpl) : super(AnswerInitialStates());
  late AnswerModel answerModel;
  Future<AnswerModel> getANswerForQuestion(int id) async {
    final dio = Dio();
    try {
      emit(AnswerLoadingStates());
      // var response = await dio.get('$baseUrl/Answer?questionId=$id');
      var response = await dio.get('$baseUrl/Answer?questionId=$id');
      answerModel = AnswerModel.json(response.data['answer'],
          response.data['doctorData'], response.data['specialty']);
      emit(AnswerSuccessStates());
      return answerModel;
    } catch (erorr) {
      emit(AnswerFailingStates());
      print(erorr.toString());
      return answerModel;
    }
  }
}
