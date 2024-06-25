import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utils/constans.dart';
import 'package:gbsub/Core/utils/style.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> customSnackBar(
    BuildContext context, final String text,
    {int duration = 1000, bool correctColors = true}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          16.w,
        ),
      ),
      duration: Duration(milliseconds: duration),
      content: Center(
        child: Text(
          text,
          style: Styles.style16.copyWith(color: Colors.white),
        ),
      ),
      backgroundColor: correctColors ? mainColor : Colors.red,
    ),
  );
}
    
// import 'package:flutter/material.dart';
// import 'package:gbsub/Core/utils/constans.dart';
// import 'package:gbsub/Core/utils/style.dart';

// ScaffoldFeatureController<SnackBar, SnackBarClosedReason> customSnackBar(
//     BuildContext context, final String text) {
//   return ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(
//       duration: const Duration(milliseconds: 500),
//       content: Center(
//         child: Text(
//           text,
//           style: Styles.style16.copyWith(color: mainColor),
//         ),
//       ),
//       backgroundColor: Colors.white,
//     ),
//   );
// }
