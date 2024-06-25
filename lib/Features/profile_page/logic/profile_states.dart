import 'package:gbsub/Features/YourClinicc/Models/reservation_models.dart';

abstract class ProfileStates {}

class ProfileInitialState extends ProfileStates {}

class ProfileLoadingState extends ProfileStates {}

class ProfileSuccessState extends ProfileStates {
  final List<ReservationModels> profileModel;

  ProfileSuccessState(this.profileModel);
}

class Updatekey extends ProfileStates {}

class ProfileImageUpdatedSuccessfully extends ProfileStates {}

class ProfileImageUpdatedLoading extends ProfileStates {}
