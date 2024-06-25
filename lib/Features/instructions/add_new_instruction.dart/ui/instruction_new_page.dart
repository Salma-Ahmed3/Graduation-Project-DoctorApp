import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Core/services/api_services.dart';
import 'package:gbsub/Features/instructions/add_new_instruction.dart/logic/add_instruction_cubit.dart';
import 'package:gbsub/Features/instructions/add_new_instruction.dart/ui/widgets/add_instruction.dart';
import 'package:gbsub/Features/instructions/add_new_instruction.dart/ui/widgets/custom_button_send.dart';
import 'package:gbsub/Features/instructions/health_advice/repos/instruction_repo_impl.dart';

class AddingNewInstructionPage extends StatelessWidget {
  const AddingNewInstructionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddInstructionCubit(
        InstructionRepoImpl(apiService: ApiService(Dio())),
      ),
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
  }
}
