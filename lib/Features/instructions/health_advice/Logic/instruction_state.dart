part of 'instruction_cubit.dart';

abstract class InstructionState {}

final class InstructionInitial extends InstructionState {}

final class InstructionLoading extends InstructionState {}

final class InstructionSuccess extends InstructionState {}

final class InstructionFailure extends InstructionState {
  final String errMessege;

  InstructionFailure(this.errMessege);
}
