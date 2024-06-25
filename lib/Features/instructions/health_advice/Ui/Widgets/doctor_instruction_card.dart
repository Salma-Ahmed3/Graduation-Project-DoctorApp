import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gbsub/Core/services/sharedpref.dart';
import 'package:gbsub/Core/utils/constans.dart';
import 'package:gbsub/Core/utils/style.dart';
import 'package:gbsub/Core/utils/widgets/custom_snack_bar.dart';
import 'package:gbsub/Features/instructions/health_advice/Logic/instruction_cubit.dart';
import 'package:gbsub/Features/instructions/health_advice/Model/instruction_models.dart';

class DoctorInstructionCard extends StatelessWidget {
  const DoctorInstructionCard({
    super.key,
    required this.instructionModels,
    required this.index,
  });

  final HealthAdviceModel instructionModels;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Card(
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(height: 100.h),
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        '$imageUrl${instructionModels.doctor.doctorPic}'),
                  ),
                  SizedBox(width: 15.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(instructionModels.doctor.doctorName,
                          style: Styles.style16),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(instructionModels.speciality.spec,
                          style: Styles.style15),
                    ],
                  ),
                  const Spacer(),
                  Sharedhelper.getintdata(intkey) == instructionModels.doctor.id
                      ? IconButton(
                          onPressed: () async {
                            await BlocProvider.of<InstructionCubit>(context)
                                .delete(
                                    index, instructionModels.healthAdvice.id);
                            if (context.mounted) {
                              if (BlocProvider.of<InstructionCubit>(context)
                                  .response) {
                                customSnackBar(context, 'تم الحذف بنجاح');
                              } else {
                                customSnackBar(context, 'فشل الحذف',
                                    correctColors: false);
                              }
                            }
                          },
                          icon: Icon(
                            FontAwesomeIcons.trashCan,
                            color: mainColor,
                          ),
                        )
                      : const SizedBox(
                          height: 0,
                          width: 0,
                        )
                ],
              ),
              SizedBox(height: 10.h),
              Text(instructionModels.healthAdvice.content,
                  style: Styles.styleBold16),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
