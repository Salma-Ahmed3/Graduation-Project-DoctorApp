import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Core/services/api_services.dart';
import 'package:gbsub/Features/instructions/add_new_instruction.dart/logic/add_instruction_cubit.dart';
import 'package:gbsub/Features/instructions/add_new_instruction.dart/ui/adding_instruction_view_body.dart';
import 'package:gbsub/Features/instructions/health_advice/repos/instruction_repo_impl.dart';

class AddingInstructionView extends StatelessWidget {
  const AddingInstructionView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: BlocProvider(
          create: (context) => AddInstructionCubit(
            InstructionRepoImpl(apiService: ApiService(Dio())),
          ),
          child: const Scaffold(
            body: AddingNewInstructionViewBody(),
          ),
        ),
      ),
    );
  }
}
