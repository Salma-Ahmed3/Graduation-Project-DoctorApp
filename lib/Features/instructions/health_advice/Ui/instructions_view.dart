import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Core/services/api_services.dart';
import 'package:gbsub/Core/utils/constans.dart';
import 'package:gbsub/Core/utils/style.dart';
import 'package:gbsub/Features/instructions/add_new_instruction.dart/ui/adding_instruction_view.dart';
import 'package:gbsub/Features/instructions/health_advice/Logic/instruction_cubit.dart';
import 'package:gbsub/Features/instructions/health_advice/Ui/instructions_view_body.dart';
import 'package:gbsub/Features/instructions/health_advice/repos/instruction_repo_impl.dart';

class InstructionsView extends StatelessWidget {
  const InstructionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          InstructionCubit(InstructionRepoImpl(apiService: ApiService(Dio())))
            ..fetchHealthadvice(pageNum: 1, pagesize: 30),

      child: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                elevation: 0,
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(color: mainColor),
                title: Text(
                  'الإرشادات',
                  style: Styles.styleBold24.copyWith(color: mainColor),
                ),
                actions: [
                  IconButton(
                    icon: Icon(
                      Icons.add,
                      color: mainColor,
                      size: 28,
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return const AddingInstructionView();
                        }),
                      );
                    },
                  ),
                ],
              ),
              body: const Scaffold(
                body: InstructionsViewBody(),
              )),
        ),
      ),
      // ),
    );
  }
}
