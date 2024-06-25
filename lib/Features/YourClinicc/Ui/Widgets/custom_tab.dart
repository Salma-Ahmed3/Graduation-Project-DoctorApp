import 'package:flutter/material.dart';
import 'package:gbsub/core/utils/style.dart';

class CustomBookingViewTap extends StatelessWidget {
  const CustomBookingViewTap({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        text,
        style: Styles.style16.copyWith(color: Colors.grey),
      ),
    );
  }
}
