import 'package:flutter/material.dart';

import 'package:gbsub/Core/utils/constans.dart';
import 'package:gbsub/Core/utils/widgets/custom_snack_bar.dart';
import 'package:gbsub/Features/YourClinicc/Models/reservation_models.dart';
import 'package:gbsub/Features/YourClinicc/Ui/Widgets/custom_reservation_button.dart';
import 'package:gbsub/Features/YourClinicc/Ui/Widgets/custom_dialog.dart';
import 'package:gbsub/Features/appointment_summary/ui/appointments_summary_view.dart';

class CustomReservationItemButtonsRow extends StatelessWidget {
  const CustomReservationItemButtonsRow({
    super.key,
    required this.reservationModels,
  });
  final ReservationModels reservationModels;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomReservationButton(
          onPressed: () async {
            if ((DateTime.now().month <
                int.parse(reservationModels.month))) //new month
            {
              customSnackBar(context, 'لا يمكن انهاء هذا الميعاد بعد');
            } else if (DateTime.now().month ==
                    int.parse(reservationModels.month) &&
                int.parse(reservationModels.day) - DateTime.now().day >
                    0) // same month new day
            {
              customSnackBar(context, 'لا يمكن انهاء هذا الميعاد بعد');
            } else if (DateTime.now().month ==
                    int.parse(reservationModels.month) &&
                int.parse(reservationModels.day) - DateTime.now().day ==
                    0) //same month same day
            {
              String hour = reservationModels.appointmentTime.substring(0, 2);
              if (int.parse(hour) - DateTime.now().hour <=
                  0) //check hour for one hour diff
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (builder) {
                      return AppointmentSummaryView(model: reservationModels);
                    },
                  ),
                );
              } else // more than one hour diff
              {
                customSnackBar(context, 'لا يمكن انهاء هذا الميعاد بعد');
              }
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (builder) {
                    return AppointmentSummaryView(model: reservationModels);
                  },
                ),
              );
            }
          },
          text: 'ملخص الجلسة',
          textcolor: Colors.white,
          buttonColor: mainColor,
        ),
        CustomReservationButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return Customdialog(reservationModels: reservationModels);
              },
            );
          },
          text: 'الغاء',
          textcolor: mainColor,
          buttonColor: Colors.white,
        ),
      ],
    );
  }
}
