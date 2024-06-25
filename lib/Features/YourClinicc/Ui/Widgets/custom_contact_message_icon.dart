import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/services/whatsapp.dart';
import 'package:gbsub/Core/utils/constans.dart';

class CustomConatctMessageIcon extends StatelessWidget {
  const CustomConatctMessageIcon({
    super.key,
    required this.name,
    required this.phoneNumber,
  });
  final String name;
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.only(bottom: 10.h),
      onPressed: () {
        launchWhatsApp(name: name, phoneNumder: phoneNumber, context: context);
      },
      icon: const Icon(Icons.message_outlined),
      color: mainColor,
    );
  }
}
