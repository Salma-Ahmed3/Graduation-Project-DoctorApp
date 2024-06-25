import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utils/constans.dart';
import 'package:gbsub/Core/utils/style.dart';
import 'package:gbsub/Core/utils/widgets/loading_body.dart';
import 'package:gbsub/Features/patients_record/Ui/patient_record_view.dart';
import 'package:gbsub/Features/personal_details/ui/personal_details_view.dart';
import 'package:gbsub/Features/profile_page/data/profile_model.dart';
import 'package:gbsub/Features/profile_page/logic/profile_cubit.dart';
import 'package:gbsub/Features/profile_page/logic/profile_states.dart';
import 'package:gbsub/Features/profile_page/ui/widgets/custom_profile_view_body_divider.dart';
import 'package:gbsub/Features/profile_page/ui/widgets/custom_profile_view_body_item.dart';
import 'package:gbsub/Features/profile_page/ui/widgets/prodile_picture_profile_view.dart';

class CustomProfileConatiner extends StatelessWidget {
  const CustomProfileConatiner({
    super.key,
    required this.profileModel,
  });
  final ProfileModel profileModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      padding: EdgeInsets.only(top: 50.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<ProfileCubit, ProfileStates>(
              builder: (context, state) {
                return state is ProfileImageUpdatedLoading
                    ? const LoadingBody()
                    : CustomProfilePictuteProfileView(
                        pic: '$imageUrl${profileModel.pic}');
              },
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              profileModel.name,
              style: Styles.style20
                  .copyWith(color: Colors.black, fontWeight: FontWeight.w600),
            ),
            Text(
              profileModel.email,
              style: Styles.style14.copyWith(color: Colors.grey),
            ),
            SizedBox(
              height: 50.h,
            ),
            CustomProfileViewBodyItem(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PatientRecordView(),
                  ),
                );
              },
              text: 'سجل المرضى',
              imageUrl: 'assets/images/note.png',
              color: const Color(0xffFA9E5C),
            ),
            const CustomDivider(),
            CustomProfileViewBodyItem(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PersonalDetialsView(
                        profileModel: profileModel,
                      );
                    },
                  ),
                );
              },
              text: 'معلومات شخصية',
              imageUrl: 'assets/images/personalcard.png',
              color: Colors.blue,
            ),
            const CustomDivider(),
            CustomProfileViewBodyItem(
              onTap: () {
                BlocProvider.of<ProfileCubit>(context).logout(context);
              },
              text: 'تسجيل الخروج',
              imageUrl: 'assets/images/logout.png',
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
