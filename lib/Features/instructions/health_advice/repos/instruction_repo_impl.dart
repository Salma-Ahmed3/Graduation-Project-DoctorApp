// ignore_for_file: unused_local_variable

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:gbsub/Core/services/api_services.dart';
import 'package:gbsub/Core/utils/Errors/failure.dart';
import 'package:gbsub/Features/instructions/health_advice/Model/instruction_models.dart';
import 'package:gbsub/Features/instructions/health_advice/repos/instruction_repo.dart';

class InstructionRepoImpl implements InstructionRepo {
  final ApiService apiService;

  InstructionRepoImpl({required this.apiService});
  List<HealthAdviceModel> healthadvices = [];

  @override
  Future<Either<Failure, List<HealthAdviceModel>>> fetchHealthAdvice(
      {required int pageNum, required int pagesize}) async {
    try {
      healthadvices = [];
      var data = await apiService.get(
          endPoint: '/HealthAdvice?pageNum=$pageNum&pagesize=$pagesize');

      for (int i = 0; i < data['doctor'].length; i++) {
        HealthAdviceModel healthAdviceModel = HealthAdviceModel.json(
            data['healthAdvice'][i], data['doctor'][i], data['spec'][i]);
        healthadvices.add(healthAdviceModel);
      }

      return right(healthadvices);
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
  Future<Either<Failure, bool>> addNewHealthAdvice(
      {required int doctorId, required String content}) async {
    try {
      var response = await apiService.postNoBody(
          endPoint: '/HealthAdvice?doctorId=$doctorId&content=$content');
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

  @override
  Future<Either<Failure, bool>> deleteAdvice(
      {required int healthadviceId}) async {
    try {
      var response = await apiService.delete(
          endpoint: '/HealthAdvice?healthadviceId=$healthadviceId');
      return right(true);
    } catch (ex) {
      if (ex is DioException) {
        return left(
          ServerFailure.fromdioException(ex),
        );
      }
      return left(
        ServerFailure(
          ex.toString(),
        ),
      );
    }
  }
}
