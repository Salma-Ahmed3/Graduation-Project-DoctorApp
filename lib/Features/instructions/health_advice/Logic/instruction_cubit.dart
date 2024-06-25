import 'package:bloc/bloc.dart';

import 'package:gbsub/Features/instructions/health_advice/Model/instruction_models.dart';
import 'package:gbsub/Features/instructions/health_advice/repos/instruction_repo.dart';

part 'instruction_state.dart';

class InstructionCubit extends Cubit<InstructionState> {
  InstructionCubit(this.instructionRepo) : super(InstructionInitial());
  late bool response;

  final InstructionRepo instructionRepo;
  List<HealthAdviceModel> instruction = [];
  Future<void> fetchHealthadvice(
      {required int pageNum, required int pagesize}) async {
    emit(InstructionLoading());
    var result = await instructionRepo.fetchHealthAdvice(
        pageNum: pageNum, pagesize: pagesize);

    result.fold((failure) {
      emit(InstructionFailure(failure.errMessage));
    }, (instructionModel) {
      instruction = instructionModel;
      emit(InstructionSuccess());
    });
  }

  Future<void> delete(index, id) async {
    instruction.remove(instruction[index]);
    emit(InstructionSuccess());
    var result = await instructionRepo.deleteAdvice(healthadviceId: id);
    result.fold((f) {
      response = false;
    }, (s) {
      emit(InstructionSuccess());
      response = true;
    });
  }
}
