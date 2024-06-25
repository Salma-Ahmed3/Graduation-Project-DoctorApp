import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gbsub/Features/Home/Ui/widgets/custom_body_continer_list_view.dart';
import 'package:gbsub/Features/Home/Ui/widgets/custom_medication_info_list_view.dart';
import 'package:gbsub/Features/Home/Ui/widgets/custom_news_container.dart';
// import 'package:gbsub/Features/YourClinicc/Ui/reservation_view.dart';
import 'package:gbsub/Features/YourClinicc/Ui/reservation_view.dart';
import 'package:gbsub/Features/body_parts/ui/diagnosis_view.dart';
import 'package:gbsub/Features/covid19_radiography/ui/coivid19_view.dart';
import 'package:gbsub/Features/diabetes_preidiction/ui/diabetes_view.dart';
import 'package:gbsub/Features/instructions/health_advice/Ui/instructions_view.dart';
import 'package:gbsub/Features/patients_record/Ui/patient_record_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            const CustomServiceRowCustomBodyContinerListView(
              mainText: 'خدماتنا الطبية',
              // ignore: deprecated_member_use
              icon1: FontAwesomeIcons.clinicMedical,
              icon2: FontAwesomeIcons.solidNoteSticky,
              icon3: FontAwesomeIcons.pen,
              text1: 'عيادتك',
              text2: 'سجل المرضى',
              text3: 'الارشادات',
              widget1: ReservationView(),
              widget2: PatientRecordView(),
              widget3: InstructionsView(),
            ),
            const CustomServiceRowCustomBodyContinerListView(
              mainText: 'خدماتنا الالكترونية',
              icon1: FontAwesomeIcons.personDotsFromLine,
              icon2: FontAwesomeIcons.glassWaterDroplet,
              icon3: FontAwesomeIcons.virusCovid,
              text1: 'تشخيص',
              text2: 'سكر الدم',
              text3: 'كوفيد 19',
              widget1: DiagnosisView(),
              widget2: DiabetesView(),
              widget3: Covid19View(),
            ),
            const CustomNewsContainer(),
            SizedBox(
              height: 20.h,
            ),
            GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) {
                  //       return const DrugContentView();
                  //     },
                  //   ),
                  // );
                },
                child: const CustomMedicalInfoListView()),
          ],
        ),
      ),
    );
  }
}
