import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Features/instructions/add_new_instruction.dart/logic/add_instruction_state.dart';
import 'package:gbsub/Features/instructions/health_advice/repos/instruction_repo.dart';

class AddInstructionCubit extends Cubit<AddInstructionState> {
  AddInstructionCubit(this.instructionRepo) : super(AddInstructionInitial());

  final InstructionRepo instructionRepo;

  String content = '';
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formkey = GlobalKey();
 
  Future<void> addNewHealthAdvice(
      {required int doctorId, required String content}) async {
    emit(NewInstructionLoading());
    var result = await instructionRepo.addNewHealthAdvice(
        doctorId: doctorId, content: content);
    result.fold((failure) {
      emit(NewInstructionFailure(failure.errMessage));
    }, (instructionModel) {
      emit(NewInstructionSuccess(instructionModel));
    });
  }

  void enterHealthAdvice(String value) {
    content = value;
    emit(InstructionChanged());
  }
}
