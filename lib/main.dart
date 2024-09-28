import 'package:flutter/material.dart';
import 'package:meditrace_project/Services/local_storage.dart';
import 'package:meditrace_project/Views/Bag%20View/bag_viewmodel.dart';
import 'package:meditrace_project/Views/Forgot%20Password%20View/forgot_password_viewmodel.dart';
import 'package:meditrace_project/Views/Home%20View/home_view.dart';
import 'package:meditrace_project/Views/Home%20View/home_viewmodel.dart';
import 'package:meditrace_project/Views/Medicine%20View/medicine_viewmodel.dart';
import 'package:meditrace_project/Views/Profile%20Update%20View/profile_update_viewmodel.dart';
import 'package:meditrace_project/Views/Profile%20View/profile_view.dart';
import 'package:meditrace_project/Views/Profile%20View/profile_viewmodel.dart';
import 'package:meditrace_project/Views/Settings%20View/setting_viewmodel.dart';
import 'package:meditrace_project/Views/Sign%20In%20View/signin_viewmodel.dart';
import 'package:meditrace_project/Views/Sign%20Up%20View/Emergency%20Contact%20View/emergency_contact_view.dart';
import 'package:meditrace_project/Views/Sign%20Up%20View/Emergency%20Contact%20View/emergency_contact_viewmodel.dart';
import 'package:meditrace_project/Views/Sign%20Up%20View/Medical%20Information%20View/medical_information_viewModel_signUp.dart';
import 'package:meditrace_project/Views/Sign%20Up%20View/Personal%20Information%20View/personal_information_viewmodel.dart';
import 'package:meditrace_project/Views/Sign%20Up%20View/Sign%20Up%20Completed/signup_completed_viewmodel.dart';
import 'package:meditrace_project/Views/Sign%20Up%20View/signup_view.dart';
import 'package:meditrace_project/Views/Sign%20Up%20View/signup_viewmodel.dart';
import 'package:meditrace_project/Views/Splash%20View/splash_view.dart';
import 'package:meditrace_project/Views/Splash%20View/splash_viewmodel.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.initialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashViewmodel()),
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

      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeView(),
      ),
    );
  }
}
