// ignore_for_file: unused_catch_clause

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Core/cubits/bottomnavigationbarcubit/MainStates.dart';
import 'package:gbsub/Core/services/sharedpref.dart';
import 'package:gbsub/Core/utils/constans.dart';
import 'package:gbsub/Features/Home/Ui/home_body_view.dart';
import 'package:gbsub/Features/profile_page/ui/profile_view.dart';
import 'package:gbsub/Features/questionandanswer/Question/Models/question_models.dart';
import 'package:gbsub/Features/questionandanswer/Question/ui/question_and_answer_view_body.dart';

class MainCubit extends Cubit<mainStates> {
  MainCubit() : super(InitialState());
  int currentIndex = 0;
  bool loggedin = false;
  List<Widget> bottomnavigationbarviews = [
    const HomeViewBody(),
    const QuestionAndAnswerViewBody(),
    const ProfileView()
  ];
  void tapped(int index) {
    currentIndex = index;
    emit(TappedState());
  }

  void LoggedInfun({bool? state}) {
    if (state != null) {
      loggedin = state;

      emit(LoggedIn());
    } else {
      loggedin = !loggedin;
      Sharedhelper.putBooldata('loggedIN', loggedin)
          .then((value) => emit(LoggedIn()));
    }
  }

  // Question and Answer cubit part

  late String question;
  List<QuestionDetails> questions = [];
  bool publicquestions = true;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formkey = GlobalKey();

  Future<List<QuestionDetails>> getQuetions() async {
    final dio = Dio();
    questions = [];
    try {
      emit(FetchingQuestionLoading());
      var response = await dio.get('$baseUrl/Question?pagesize=10&pageNum=1');
      print(response.data['question'].length);

      for (int i = 0; i < response.data['question'].length; i++) {
        QuestionDetails questionDetails = QuestionDetails.json(
            response.data['question'][i], response.data['user'][i]);

        questions.add(questionDetails);
      }

      emit(FetchingQuestionSucsess());
      return questions;
    } on Exception catch (e) {
      print(e.toString());
      emit(FetchingQuestionFailing());
      return [];
    }
  }
  // Reservation
}
