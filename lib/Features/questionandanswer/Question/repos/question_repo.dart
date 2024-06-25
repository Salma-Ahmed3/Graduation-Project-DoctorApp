import 'package:dartz/dartz.dart';
import 'package:gbsub/Core/utils/Errors/failure.dart';
import 'package:gbsub/Features/questionandanswer/Question/Models/question_models.dart';

abstract class QuestionAndAnswerRepo {
  Future<Either<Failure, List<QuestionDetails>>> getQuetions(
      {required int pageNum, required int pagesize});

  Future<Either<Failure, bool>> addAnswerQustion(
      {required int questionId,
      required int doctorId,
      required String content});
}
