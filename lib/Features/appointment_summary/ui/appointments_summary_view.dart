import 'package:flutter/material.dart';
import 'package:gbsub/Features/YourClinicc/Models/reservation_models.dart';
import 'package:gbsub/Features/appointment_summary/ui/appointments_view_body.dart';
import 'package:gbsub/Features/questionandanswer/asnwer/ui/CustomAppbar.dart';

class AppointmentSummaryView extends StatelessWidget {
  const AppointmentSummaryView({super.key, required this.model});
  final ReservationModels model;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const CustomAppbar(title: 'ملخص الكشف'),
        body: AppointmentSummaryViewBody(model: model),
      ),
    );
  }
}
