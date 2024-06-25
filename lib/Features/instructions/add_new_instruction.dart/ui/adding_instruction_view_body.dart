import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Features/instructions/add_new_instruction.dart/logic/add_instruction_cubit.dart';
import 'package:gbsub/Features/instructions/add_new_instruction.dart/logic/add_instruction_state.dart';
import 'package:gbsub/Features/instructions/add_new_instruction.dart/ui/widgets/add_instruction.dart';
import 'package:gbsub/Features/instructions/add_new_instruction.dart/ui/widgets/custom_button_send.dart';

class AddingNewInstructionViewBody extends StatelessWidget {
  const AddingNewInstructionViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddInstructionCubit, AddInstructionState>(
      builder: (context, state) {
        return Form(
          key: BlocProvider.of<AddInstructionCubit>(context).formkey,
          autovalidateMode:
              BlocProvider.of<AddInstructionCubit>(context).autovalidateMode,
          child: const CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: AddInstraction(),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: ButtonSend(),
              )
            ],
          ),
        );
      },
    );
  }
}
