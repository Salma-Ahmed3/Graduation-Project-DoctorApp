import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/services/sharedpref.dart';
import 'package:gbsub/Core/utils/constans.dart';
import 'package:gbsub/Features/YourClinicc/Models/reservation_models.dart';
import 'package:gbsub/Features/YourClinicc/logic/reservation_cubit.dart';
import 'package:gbsub/Features/YourClinicc/logic/reservation_states.dart';
import 'package:gbsub/Features/appointment_summary/ui/widgets/lib/Features/appointment_summary/ui/widgets/custom_appointment_summary_text_form_feild.dart';
import 'package:gbsub/core/utils/style.dart';

class AppointmentSummaryViewBody extends StatelessWidget {
  const AppointmentSummaryViewBody({super.key, required this.model});
  final ReservationModels model;
  @override
  Widget build(BuildContext context) {
    var of = BlocProvider.of<ReservationCubit>(context);
    return BlocBuilder<ReservationCubit, ReservationStates>(
      builder: (context, state) {
        return Form(
          key: of.key,
          autovalidateMode: of.autovalidateMode,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Column(
                    children: [
                      CustomAppointmentSummaryTextFormFeild(
                        label: 'العرض الرئيسي',
                        onChanged: (v) {
                          of.diesaseChanged(v);
                        },
                        validator: (p0) {
                          if (p0?.isEmpty ?? true) {
                            return "هذا الحقل مطلوب";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomAppointmentSummaryTextFormFeild(
                        label: 'ملخص التشخيص',
                        maxlines: 5,
                        onChanged: (v) {
                          of.noteChanged(v);
                        },
                        validator: (p0) {
                          if (p0?.isEmpty ?? true) {
                            return "هذا الحقل مطلوب";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    const Spacer(),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: mainColor,
                          minimumSize: Size(300.w, 50.h)),
                      onPressed: () async {
                        if (of.key.currentState!.validate()) {
                          bool checker = await of.PostSummary(
                              model, of.disease, of.summary);
                          if (checker) {
                            debugPrint('true');
                            await of.fetchReservationDone(
                                Sharedhelper.getintdata(intkey), false);
                            Navigator.pop(context);
                          } else {
                            debugPrint('false');
                          }
                        } else {
                          of.autovalidateMode = AutovalidateMode.always;
                        }
                      },
                      child: Text(
                        "أنهاء",
                        style: Styles.style16.copyWith(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
