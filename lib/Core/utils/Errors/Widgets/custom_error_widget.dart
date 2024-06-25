import 'package:flutter/material.dart';
import 'package:gbsub/Core/utils/style.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errMessage});
  final String errMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errMessage,
        style: Styles.style16,
        textAlign: TextAlign.center,
      ),
    );
  }
}
