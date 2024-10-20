import 'package:flutter/material.dart';
import 'package:meditrace_project/Services/back_ground_service.dart';
import 'package:meditrace_project/Views/Bag%20View/bag_viewmodel.dart';
import 'package:meditrace_project/Views/Forgot%20Password%20Views/Create%20New%20Password%20View/create_newpassword_viewmodel.dart';
import 'package:meditrace_project/Views/Forgot%20Password%20Views/Entering%20Email%20View/forgot_password_viewmodel.dart';
import 'package:meditrace_project/Views/Forgot%20Password%20Views/Entering%20OTP%20View/entering_otp_viewmodel.dart';
import 'package:meditrace_project/Views/Forgot%20Password%20Views/Password%20Changed%20View/password_changed_viewmodel.dart';
import 'package:meditrace_project/Views/Home%20View/home_viewmodel.dart';
import 'package:meditrace_project/Views/Medications%20View/Maually%20Add%20Views/Add%20Medication%20View/add_medication_viewmodel.dart';
import 'package:meditrace_project/Views/Medications%20View/Maually%20Add%20Views/Frequency%20And%20Time%20Views/Frequency%20Selection%20View/frequency_viewmodel.dart';
import 'package:meditrace_project/Views/Medications%20View/Maually%20Add%20Views/Frequency%20And%20Time%20Views/Selection%20View/selection_viewmodel.dart';
import 'package:meditrace_project/Views/Medications%20View/Maually%20Add%20Views/Frequency%20And%20Time%20Views/Time%20View/TIme%20Picker%20View/time_picker_viewmodel.dart';
import 'package:meditrace_project/Views/Medications%20View/Maually%20Add%20Views/Frequency%20And%20Time%20Views/Time%20View/time_viewmodel.dart';
import 'package:meditrace_project/Views/Medications%20View/Maually%20Add%20Views/Review%20Medication%20View/review_medication_viewmodel.dart';
import 'package:meditrace_project/Views/Medicine%20View/medicine_viewmodel.dart';
import 'package:meditrace_project/Views/Profile%20Update%20View/profile_update_viewmodel.dart';
import 'package:meditrace_project/Views/Profile%20View/profile_viewmodel.dart';
import 'package:meditrace_project/Views/Settings%20View/setting_viewmodel.dart';
import 'package:meditrace_project/Views/Sign%20In%20View/signin_viewmodel.dart';
import 'package:meditrace_project/Views/Sign%20Up%20View/Emergency%20Contact%20View/emergency_contact_viewmodel.dart';
import 'package:meditrace_project/Views/Sign%20Up%20View/Medical%20Information%20View/medical_information_viewModel_signUp.dart';
import 'package:meditrace_project/Views/Sign%20Up%20View/Personal%20Information%20View/personal_information_viewmodel.dart';
import 'package:meditrace_project/Views/Sign%20Up%20View/Sign%20Up%20Completed/signup_completed_viewmodel.dart';
import 'package:meditrace_project/Views/Sign%20Up%20View/signup_viewmodel.dart';
import 'package:meditrace_project/Views/Splash%20View/splash_view.dart';
import 'package:meditrace_project/Views/Splash%20View/splash_viewmodel.dart';
import 'package:provider/provider.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await BackGroundService.initializing();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This Class is the Root of Application to Run Or Debug

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashViewmodel()),
        ChangeNotifierProvider(create: (_) => TimeViewmodel()),
        ChangeNotifierProvider(create: (_) => TimePickerViewmodel()),

        ChangeNotifierProvider(create: (_) => FrequencyViewmodel()),
        ChangeNotifierProvider(create: (_) => AddMedicationViewmodel()),
        ChangeNotifierProvider(create: (_) => SelectionViewmodel()),
        ChangeNotifierProvider(create: (_) => PersonalInformationViewmodel()),
        ChangeNotifierProvider(create: (_) => SigninViewmodel()),
        ChangeNotifierProvider(create: (_) => SignUpViewmodel()),
        ChangeNotifierProvider(
            create: (_) => MedicalInformationSignUpViewModel()),
        ChangeNotifierProvider(create: (_) => EmergencyContactViewmodel()),
        ChangeNotifierProvider(create: (_) => SignupCompletedViewmodel()),
        ChangeNotifierProvider(create: (_) => BagViewmodel()),
        ChangeNotifierProvider(create: (_) => HomeViewmodel()),
        ChangeNotifierProvider(create: (_) => MedicineViewmodel()),
        ChangeNotifierProvider(create: (_) => ProfileViewmodel()),
        ChangeNotifierProvider(create: (_) => ProfileUpdateViewmodel()),
        ChangeNotifierProvider(create: (_) => SettingViewmodel()),
        ChangeNotifierProvider(create: (_) => ForgotPasswordViewmodel()),
        ChangeNotifierProvider(create: (_) => EnteringOtpViewmodel()),
        ChangeNotifierProvider(create: (_) => CreateNewpasswordViewmodel()),
        ChangeNotifierProvider(create: (_) => PasswordChangedViewModel()),
        ChangeNotifierProvider(create: (_) => ReviewMedicationViewmodel()),

      ],
      child: const MaterialApp(
          debugShowCheckedModeBanner: false, home: SplashView()),
    );
  }
}
