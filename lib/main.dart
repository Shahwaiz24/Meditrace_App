import 'package:flutter/material.dart';
import 'package:meditrace_project/Services/local_storage.dart';
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
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashView(),
      ),
    );
  }
}
