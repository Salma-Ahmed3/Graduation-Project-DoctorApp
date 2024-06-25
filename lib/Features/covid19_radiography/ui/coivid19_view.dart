import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Features/covid19_radiography/logic/covid19_cubit.dart';
import 'package:gbsub/Features/covid19_radiography/ui/covid19_view_body.dart';
import 'package:gbsub/Features/questionandanswer/asnwer/ui/CustomAppbar.dart';

class Covid19View extends StatelessWidget {
  const Covid19View({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocProvider(
        create: (context) => Covid19Cubit(),
        child: const SafeArea(
          child: Scaffold(
            appBar: CustomAppbar(title: 'تشخيص كوفيد 19'),
            body: Covid19ViewBody(),
          ),
        ),
      ),
    );
  }
}
