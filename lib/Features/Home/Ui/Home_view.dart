import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Core/cubits/bottomnavigationbarcubit/MainCubi.dart';
import 'package:gbsub/Core/cubits/bottomnavigationbarcubit/MainStates.dart';
import 'package:gbsub/Features/Home/Ui/widgets/custom_bottom_navigation_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: BlocBuilder<MainCubit, mainStates>(
            builder: (context, state) {
              var myblocprovider = BlocProvider.of<MainCubit>(context);
              return myblocprovider
                  .bottomnavigationbarviews[myblocprovider.currentIndex];
            },
          ),
          bottomNavigationBar: const CustomBottomNavBar(),
        ),
      ),
    );
  }
}
