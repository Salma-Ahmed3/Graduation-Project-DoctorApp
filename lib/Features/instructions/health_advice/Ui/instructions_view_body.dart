import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utils/widgets/failed_body.dart';
import 'package:gbsub/Core/utils/widgets/loading_body.dart';
import 'package:gbsub/Features/YourClinicc/Ui/Widgets/success_empty_body.dart';
import 'package:gbsub/Features/instructions/health_advice/Logic/instruction_cubit.dart';
import 'package:gbsub/Features/instructions/health_advice/Ui/Widgets/doctor_instruction_card.dart';

class InstructionsViewBody extends StatelessWidget {
  const InstructionsViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InstructionCubit, InstructionState>(
      builder: (context, state) {
        if (state is InstructionSuccess) {
          return BlocProvider.of<InstructionCubit>(context).instruction.isEmpty
              ? const ScuccesEmptyBody(text: 'لا يوجد نصائح ليتم عرضها')
              : ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: BlocProvider.of<InstructionCubit>(context)
                      .instruction
                      .length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(height: 10.h),
                        DoctorInstructionCard(
                          index: index,
                          instructionModels:
                              BlocProvider.of<InstructionCubit>(context)
                                  .instruction[index],
                        ),
                      ],
                    );
                  },
                );
        } else if (state is InstructionFailure) {
          return FailedBody(text: state.errMessege);
        } else {
          return const LoadingBody();
        }
      },
    );
  }
}
