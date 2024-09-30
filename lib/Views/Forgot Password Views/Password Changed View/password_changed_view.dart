import 'package:flutter/material.dart';
import 'package:meditrace_project/Services/utils.dart';
import 'package:meditrace_project/Views/Forgot%20Password%20Views/Password%20Changed%20View/password_changed_viewmodel.dart';
import 'package:provider/provider.dart';

class PasswordChangedView extends StatelessWidget {
  const PasswordChangedView({super.key, required this.isError});
  final bool isError;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<PasswordChangedViewModel>(context, listen: false);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    model.showPage();

    return Scaffold(
      backgroundColor: AppColors.ScaffoldColor,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Consumer<PasswordChangedViewModel>(
          builder: (context, model, child) {
            return model.animatedWidget(
                screenHeight: screenHeight,
                screenWidth: screenWidth,
                context: context,
                isError: isError);
          },
        ),
      ),
    );
  }
}
