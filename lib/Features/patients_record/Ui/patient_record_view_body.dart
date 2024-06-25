import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Core/utils/widgets/failed_body.dart';
import 'package:gbsub/Core/utils/widgets/loading_body.dart';
import 'package:gbsub/Features/YourClinicc/Ui/Widgets/success_empty_body.dart';
import 'package:gbsub/Features/patients_record/Ui/widgets/patient_record_list_page.dart';
import 'package:gbsub/Features/patients_record/logic/patients_record_cubit.dart';
import 'package:gbsub/Features/patients_record/logic/patients_record_state.dart';

class PatientRecordViewBody extends StatelessWidget {
  const PatientRecordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PatientsRecordCubit, PatientsRecordState>(
      builder: (context, state) {
        if (state is FetchPateintRecordsLoading) {
          return const LoadingBody();
        } else if (state is FetchPateintRecordsFailed) {
          return const FailedBody(text: 'لا يوجد اتصال بالانترنت');
        } else {
          return BlocProvider.of<PatientsRecordCubit>(context).pateints.isEmpty
              ? const ScuccesEmptyBody(text: 'لا يوجد سجل في الوقت الحالي')
              : const PatientRecordListView();
        }
      },
    );
  }
}
