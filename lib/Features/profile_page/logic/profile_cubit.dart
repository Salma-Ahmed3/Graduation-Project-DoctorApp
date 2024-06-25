// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Core/services/sharedpref.dart';
import 'package:gbsub/Core/utils/constans.dart';
import 'package:gbsub/Features/Login/Ui/login_view.dart';
import 'package:gbsub/Features/profile_page/data/profile_model.dart';
import 'package:gbsub/Features/profile_page/logic/profile_states.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitialState());
  late ProfileModel profileModel;
  final Dio dio = Dio();

  Future<void> getprofiledetails(int id) async {
    try {
      print(Sharedhelper.getintdata(intkey));
      var response = await dio.get('$baseUrl/Doctor?id=$id');
      profileModel = ProfileModel.fromjson(response.data);
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  Future<bool> updateProfilePic() async {
    File? selectedImage;
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) {
      return false;
    } else {
      selectedImage = File(returnedImage.path);
      var data = FormData.fromMap({
        'image': await MultipartFile.fromFile(selectedImage.path),
        "doctorId": Sharedhelper.getintdata(intkey),
      });
      try {
        emit(ProfileImageUpdatedLoading());
        await dio.put('$baseUrl/Doctor', data: data);
        emit(ProfileImageUpdatedSuccessfully());
        return true;
      } catch (ex) {
        return false;
      }
    }
  }

  void logout(context) async {
    await Sharedhelper.putBooldata(boolkey, false);
    await Sharedhelper.deleteInt(intkey);
    emit(Updatekey());
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const LoginView();
        },
      ),
    );
  }
}
