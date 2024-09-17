import 'package:flutter/material.dart';
import 'package:meditrace_project/Services/local_storage.dart';
import 'package:meditrace_project/Views/Sign%20In%20View/signin_viewmodel.dart';
import 'package:meditrace_project/Views/Sign%20Up%20View/Medical%20Information%20SignUp%20View/medical_information_signUp.dart';
import 'package:meditrace_project/Views/Sign%20Up%20View/Medical%20Information%20SignUp%20View/medical_information_viewModel_signUp.dart';
import 'package:meditrace_project/Views/Sign%20Up%20View/Personal%20Information%20View/personal_information_view.dart';
import 'package:meditrace_project/Views/Sign%20Up%20View/Personal%20Information%20View/personal_information_viewmodel.dart';
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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashView(),
      ),
    );
  }
}
