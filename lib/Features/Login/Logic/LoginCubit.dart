import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Core/utils/constans.dart';
import 'package:gbsub/Features/Login/Logic/loginstates.dart';
import 'package:dio/dio.dart';

class Logincubit extends Cubit<LoginStates> {
  Logincubit() : super(LoginInitialstate());

  late String email;
  late String password;
  late int id;
  bool isobscure = true;
  bool loginState = false;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formkey = GlobalKey();
  void showpassword() {
    isobscure = !isobscure;
    emit(ObscureChangedstate());
  }

  void onEmailfeildchanged(String x) {
    email = x;

    emit(LoginChangedstate());
  }

  void onEmialfeildsaved(String x) {
    email = x;
  }

  void onPasswordfeildchanged(String x) {
    password = x;
    emit(LoginChangedstate());
  }

  void onPasswordfeildsaved(String? x) {
    password = x!;
  }

  Future<bool> login(Dio dio) async {
    emit(LoginLoadingState());
    var response =
        await dio.get('$baseUrl/Doctor/Log IN?email=$email&password=$password');
    response.statusCode == 200 &&
            response.data == "wrong email or password try again"
        ? loginState = false
        : loginState = true;
    if (loginState) {
      id = response.data;
      emit(LoginSuccessed());

      return true;
    } else {
      emit(Loginfailed());
      return false;
    }
  }
}
