import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utils/constans.dart';
import 'package:gbsub/Features/profile_page/logic/profile_cubit.dart';

class CustomProfilePictuteProfileView extends StatelessWidget {
  const CustomProfilePictuteProfileView({
    super.key,
    required this.pic,
  });
  final String pic;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(60.w),
          child: Image.network(
            pic,
            fit: BoxFit.fill,
            width: 120.w,
            height: 120.w,
          ),
        ),
        Positioned(
          top: 95.h,
          left: 90.w,
          child: CircleAvatar(
            radius: 12.w,
            backgroundColor: Colors.white,
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(
                Icons.edit_outlined,
                size: 20,
                color: mainColor,
              ),
              onPressed: () {
                BlocProvider.of<ProfileCubit>(context).updateProfilePic();
              },
            ),
          ),
        ),
      ]),
    );
  }
}
