// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gbsub/Core/services/sharedpref.dart';
// import 'package:gbsub/Core/utils/constans.dart';
// import 'package:gbsub/Core/utils/style.dart';
// import 'package:gbsub/Features/YourClinicc/Ui/Widgets/success_empty_body.dart';
// import 'package:gbsub/Features/YourClinicc/logic/reservation_cubit.dart';
// import 'package:gbsub/Features/YourClinicc/logic/reservation_states.dart';

// class ListReservationCanceldViewBody extends StatelessWidget {
//   const ListReservationCanceldViewBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ReservationCubit, ReservationStates>(
//       builder: (context, state) {
//         return BlocProvider(
//           create: (context) => ReservationCubit(),
//           child: FutureBuilder(
//             future: ReservationCubit()
//                 .fetchReservationDone(Sharedhelper.getintdata(intkey), true),
//             builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return Center(
//                   child: CircularProgressIndicator(
//                     color: mainColor,
//                   ),
//                 );
//               } else if (snapshot.connectionState == ConnectionState.done) {
//                 return snapshot.data.isEmpty
//                     ? const ScuccesEmptyBody(
//                         text: 'لا توجد حجوزات ملغية',
//                       )
//                     : SucessBody(
//                         reservationModels: snapshot.data,
//                       );
//               } else {
//                 return Center(
//                   child: Text(
//                     'لا توجد مواعيد ',
//                     style: Styles.styleBold24.copyWith(color: mainColor),
//                   ),
//                 );
//               }
//             },
//           ),
//         );
//       },
//     );
//   }
// }
