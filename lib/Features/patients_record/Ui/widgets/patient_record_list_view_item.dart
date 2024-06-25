import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gbsub/Core/services/whatsapp.dart';
import 'package:gbsub/Core/utils/assets.dart';
import 'package:gbsub/Core/utils/constans.dart';
import 'package:gbsub/Core/utils/style.dart';
import 'package:gbsub/Features/patients_record/Data/patients_mode.dart';
import 'package:gbsub/Features/profile_page/ui/widgets/custom_profile_view_body_divider.dart';

class PatientRecordListViewItem extends StatelessWidget {
  const PatientRecordListViewItem({super.key, required this.pateint});
  final PateintsRecord pateint;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 10.w,
              ),
              CircleAvatar(
                radius: 40.w,
                backgroundImage: NetworkImage('$imageUrl${pateint.user.pic}'),
              ),
              SizedBox(
                width: 10.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(pateint.user.name, style: Styles.style16),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(pateint.diagnosis.mainDisease,
                      style: Styles.style16.copyWith(color: Colors.grey)),
                  SizedBox(
                    height: 10.h,
                  ),
                  Opacity(
                    opacity: 0.8,
                    child: Text(pateint.diagnosis.datatime.substring(0, 11),
                        style: Styles.style16.copyWith(color: Colors.grey)),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  launchWhatsApp(
                      name: pateint.user.name,
                      phoneNumder: pateint.user.phone,
                      context: context);
                },
                icon: Icon(
                  FontAwesomeIcons.whatsapp,
                  color: mainColor,
                ),
              ),
              SizedBox(
                width: 25.w,
              )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          const CustomDivider(),
        ],
      ),
    );
  }
}
