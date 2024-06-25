import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utils/constans.dart';
import 'package:gbsub/Core/utils/style.dart';
import 'package:gbsub/Features/YourClinicc/Models/reservation_models.dart';
import 'package:gbsub/Features/YourClinicc/Ui/Widgets/custom_reservation_informations.dart';
import 'package:gbsub/Features/YourClinicc/Ui/Widgets/custom_divider.dart';
import 'package:gbsub/Features/YourClinicc/Ui/Widgets/custom_reservation_item_image.dart';

class CustomDoneReservationItem extends StatelessWidget {
  const CustomDoneReservationItem({
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
                pic: '$imageUrl${reservationModels.pic}',
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
          Text(
            'تم أنهاء هذا الحجز',
            style: Styles.style16.copyWith(color: mainColor),
          ),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }
}
