import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utils/style.dart';

class CustomReservationInformations extends StatelessWidget {
  const CustomReservationInformations({
    super.key,
    required this.name,
    required this.month,
    required this.day,
    required this.year,
    required this.appointmentTime,
  });
  final String name;
  final String month;
  final String day;
  final String year;
  final String appointmentTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: Styles.styleBold16
              .copyWith(color: Colors.black, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 15.h,
        ),
        Text(
          '$year/$month/$day | $appointmentTime',
          style: Styles.style14.copyWith(
            color: const Color(0xff616161),
          ),
        ),
      ],
    );
  }
}
