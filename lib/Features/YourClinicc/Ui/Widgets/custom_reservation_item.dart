import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Features/YourClinicc/Models/reservation_models.dart';
import 'package:gbsub/Features/YourClinicc/Ui/Widgets/custom_reservation_informations.dart';
import 'package:gbsub/Features/YourClinicc/Ui/Widgets/custom_buttons_row.dart';
import 'package:gbsub/Features/YourClinicc/Ui/Widgets/custom_divider.dart';
import 'package:gbsub/Features/YourClinicc/Ui/Widgets/custom_reservation_item_image.dart';

class CustomReservationItem extends StatelessWidget {
  const CustomReservationItem({
    super.key,
    required this.reservationModels,
  });
  final ReservationModels reservationModels;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CutomReservationItemImage(
                pic: reservationModels.pic,
              ),
              CustomReservationInformations(
                  name: reservationModels.name,
                  month: reservationModels.month,
                  day: reservationModels.day,
                  year: reservationModels.year,
                  appointmentTime: reservationModels.appointmentTime),
              // This Is Messege Whith Doctor
              // const CustomConatctMessageIcon()
            ],
          ),
          const CustomReservationDivider(),
          SizedBox(
            height: 5.h,
          ),
          CustomReservationItemButtonsRow(
            reservationModels: reservationModels,
          ),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }
}
