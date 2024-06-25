import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Core/utils/constans.dart';
import 'package:gbsub/Features/YourClinicc/Models/reservation_models.dart';
import 'package:gbsub/Features/YourClinicc/logic/reservation_states.dart';

class ReservationCubit extends Cubit<ReservationStates> {
  List<ReservationModels> times = [];
  List<bool> timespicked = [];
  final Dio dio = Dio();
  bool timePicked = false;
  late String appointmentTime;
  late int doctorid;
  late int timeid;
  GlobalKey<FormState> key = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String disease;
  late String summary;

  ReservationCubit() : super(ReservationInitial());
  // final Dio dio;
  List<ReservationModels> listreservation = [];
  Future<List<ReservationModels>> fetchReservationDone(
      int doctorid, bool state) async {
    try {
      listreservation = [];
      var response = await dio.get(
          '$baseUrl/AppointmentContoller/GetDoctorAppointments?doctorId=$doctorid&state=$state');

      for (var element in response.data) {
        ReservationModels instruction = ReservationModels.json(element);
        listreservation.add(instruction);
      }
      emit(ReservationDelete());
      return listreservation;
    } catch (ex) {
      return [];
    }
  }

  Future<bool> deleteAppointments(int appointmentid) async {
    try {
      await dio.delete(
          "$baseUrl/AppointmentContoller/DeleteForDoctor?AppontmentId=$appointmentid");

      return true;
    } catch (ex) {
      return false;
    }
  }

  void diesaseChanged(value) {
    disease = value;
    autovalidateMode = AutovalidateMode.disabled;
    emit(FormFeildChanged());
  }

  void noteChanged(value) {
    summary = value;
    autovalidateMode = AutovalidateMode.disabled;
    emit(FormFeildChanged());
  }

  Future<bool> PostSummary(ReservationModels model, disease, summary) async {
    var data = {
      "apponitmentId": model.id,
      "userId": model.userid,
      "doctorId": model.doctorid,
      "summaryOfTheSession": disease,
      "mainDiseases": summary,
      "datetime": DateTime.now().toString()
    };
    try {
      await dio.post('$baseUrl/Diagnosis', data: data);
      return true;
    } catch (ex) {
      return false;
    }
  }
}
