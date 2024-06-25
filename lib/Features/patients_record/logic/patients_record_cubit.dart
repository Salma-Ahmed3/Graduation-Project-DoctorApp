import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Core/services/sharedpref.dart';
import 'package:gbsub/Core/utils/constans.dart';
import 'package:gbsub/Features/patients_record/Data/patients_mode.dart';
import 'package:gbsub/Features/patients_record/logic/patients_record_state.dart';

class PatientsRecordCubit extends Cubit<PatientsRecordState> {
  PatientsRecordCubit(this.dio) : super(PatientsRecordInitial());
  final Dio dio;
  List<PateintsRecord> pateints = [];

  Future<void> getPatients() async {
    try {
      emit(FetchPateintRecordsLoading());
      pateints = [];
      var response = await dio.get(
          '$baseUrl/Diagnosis/GetDiagnosisForADoctor?doctorid=${Sharedhelper.getintdata(intkey)}');
      for (int i = 0; i < response.data['diagnosis'].length; i++) {
        PateintsRecord pateintsRecord = PateintsRecord.formJson(
            response.data['diagnosis'][i], response.data['user'][i]);
        pateints.add(pateintsRecord);
      }
      emit(FetchPateintRecordsSuccess());
    } on Exception catch (e) {
      emit(FetchPateintRecordsFailed());
    }
  }
}
