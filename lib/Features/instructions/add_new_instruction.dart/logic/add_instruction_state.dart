abstract class AddInstructionState {}

class AddInstructionInitial extends AddInstructionState {}

class InstructionChanged extends AddInstructionState {}

class NewInstructionLoading extends AddInstructionState {}

class NewInstructionFailure extends AddInstructionState {
  final String errMessege;

  NewInstructionFailure(this.errMessege);
}

class NewInstructionSuccess extends AddInstructionState {
  final bool newinstruction;

  NewInstructionSuccess(this.newinstruction);
}
