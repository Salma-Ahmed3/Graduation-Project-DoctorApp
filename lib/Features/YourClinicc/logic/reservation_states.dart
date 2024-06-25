abstract class ReservationStates {}

class ReservationInitial extends ReservationStates {}

class ReservationLoading extends ReservationStates {}

class ReservationDelete extends ReservationStates {}

class ReservationSuccess extends ReservationStates {}

class ReservationFailure extends ReservationStates {}

class FormFeildChanged extends ReservationStates {}

class ReservationTimesLoadingSuccessState extends ReservationStates {}

class ReservationDatePickedState extends ReservationStates {}
