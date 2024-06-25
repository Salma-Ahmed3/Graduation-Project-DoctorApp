// ignore_for_file: unused_local_variable

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:gbsub/Core/services/api_services.dart';
import 'package:gbsub/Core/utils/Errors/failure.dart';
import 'package:gbsub/Core/utils/constans.dart';
import 'package:gbsub/Features/questionandanswer/Question/Models/question_models.dart';
import 'package:gbsub/Features/questionandanswer/Question/repos/question_repo.dart';

class QuestionAndAnswerRepoImpl implements QuestionAndAnswerRepo {
  final ApiService apiService;
  late String question;
  List<QuestionDetails> questions = [];
  QuestionAndAnswerRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, List<QuestionDetails>>> getQuetions(
      {required int pageNum, required int pagesize}) async {
    final dio = Dio();
    try {
      questions = [];

      var response = await dio.get('$baseUrl/Question?pagesize=10&pageNum=1');
      for (int i = 0; i < response.data['question'].length; i++) {
        QuestionDetails questionDetails = QuestionDetails.json(
            response.data['question'][i], response.data['user'][i]);
        questions.add(questionDetails);
      }
      return right(questions);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromdioException(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> addAnswerQustion(
      {required int questionId,
      required int doctorId,
      required String content}) async {
    try {
      var response = await apiService.postNoBody(
          endPoint:
              '/Answer?content=$content&doctorId=$doctorId&QuestionId=$questionId');
      return right(true);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromdioException(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
