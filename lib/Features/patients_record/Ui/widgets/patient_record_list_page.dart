import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Features/patients_record/Ui/widgets/patient_record_list_view_item.dart';
import 'package:gbsub/Features/patients_record/logic/patients_record_cubit.dart';

class PatientRecordListView extends StatelessWidget {
  const PatientRecordListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount:
            BlocProvider.of<PatientsRecordCubit>(context).pateints.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: PatientRecordListViewItem(
              pateint:
                  BlocProvider.of<PatientsRecordCubit>(context).pateints[index],
            ),
          );
        });
  }
}
