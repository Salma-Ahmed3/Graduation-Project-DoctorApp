import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Features/YourClinicc/Models/reservation_models.dart';
import 'package:gbsub/Features/YourClinicc/Ui/Widgets/custom_upcoming_reservation_item.dart';

class SucessUpcomingBody extends StatelessWidget {
  const SucessUpcomingBody({
    super.key,
    required this.reservationModels,
  });
  final List<ReservationModels> reservationModels;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        children: [
          SizedBox(
            height: 25.h,
          ),
          Expanded(
            child: ListView.separated(
              itemCount: reservationModels.length,
              itemBuilder: (context, index) {
                return CustomUpcomingReservationItem(
                  reservationModels: reservationModels[index],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 20.h,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
