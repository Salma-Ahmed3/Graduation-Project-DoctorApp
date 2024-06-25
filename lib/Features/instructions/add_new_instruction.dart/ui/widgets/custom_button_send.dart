import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/services/sharedpref.dart';
import 'package:gbsub/Core/utils/constans.dart';
import 'package:gbsub/Features/instructions/add_new_instruction.dart/logic/add_instruction_cubit.dart';
import 'package:gbsub/Features/instructions/health_advice/Ui/instructions_view.dart';

class ButtonSend extends StatelessWidget {
  const ButtonSend({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Spacer(),
      ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: mainColor),
        onPressed: () async {
          if (BlocProvider.of<AddInstructionCubit>(context)
              .formkey
              .currentState!
              .validate()) {
            await BlocProvider.of<AddInstructionCubit>(context)
                .addNewHealthAdvice(
              doctorId: Sharedhelper.getintdata(intkey),
              content: BlocProvider.of<AddInstructionCubit>(context).content,
            );
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const InstructionsView();
                },
              ),
            );
          } else {
            BlocProvider.of<AddInstructionCubit>(context).autovalidateMode =
                AutovalidateMode.always;
          }
        },
        child: Text(
          "نشر",
          style: TextStyle(color: Colors.white, fontSize: 23.sp),
        ),
      ),
      SizedBox(
        height: 10.h,
      )
    ]);
  }
}
