import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Core/services/sharedpref.dart';
import 'package:gbsub/Core/utils/constans.dart';
import 'package:gbsub/Core/utils/widgets/custom_snack_bar.dart';
import 'package:gbsub/Features/YourClinicc/Models/reservation_models.dart';
import 'package:gbsub/Features/YourClinicc/logic/reservation_cubit.dart';
import 'package:gbsub/core/utils/style.dart';

class Customdialog extends StatelessWidget {
  const Customdialog({
    super.key,
    required this.reservationModels,
  });
  final ReservationModels reservationModels;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'حذف الميعاد',
        style: Styles.styleBold16,
        textAlign: TextAlign.center,
      ),
      content: Text(
        '!تاكيد حذف الميعاد',
        textAlign: TextAlign.center,
        style: Styles.style14,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'لا',
            style: Styles.style14,
          ),
        ),
        TextButton(
          onPressed: () async {
            var of = BlocProvider.of<ReservationCubit>(context);
            bool checker = await of.deleteAppointments(reservationModels.id);
            if (checker) {
              Navigator.of(context).pop(await of.fetchReservationDone(
                  Sharedhelper.getintdata(intkey), false));
            } else {
              Navigator.of(context).pop();
              customSnackBar(context, 'لا يمكن حذف هذا الميعاد',
                  duration: 1500);
            }
          },
          child: Text(
            'نعم',
            style: Styles.style14,
          ),
        ),
      ],
    );
  }
}
