import 'package:flutter/material.dart';
import 'package:meditrace_project/Components/button.dart';
import 'package:meditrace_project/Services/global_Data.dart';
import 'package:meditrace_project/Services/utils.dart';
import 'package:meditrace_project/Views/Sign%20Up%20View/Sign%20Up%20Completed/signup_completed_viewmodel.dart';
import 'package:provider/provider.dart';

class SignupCompletedView extends StatelessWidget {
  const SignupCompletedView({super.key, required this.isError,required this.userId});
  final bool isError;
  final String userId;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<SignupCompletedViewmodel>(context, listen: false);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    model.start();
    return Scaffold(
        backgroundColor: AppColors.ScaffoldColor,
        body: Consumer<SignupCompletedViewmodel>(
            builder: (context, model, child) {
          return model.animatedWidget(
              userId: userId,
              context: context,
              isError: isError,
              screenHeight: screenHeight,
              screenWidth: screenWidth);
        }));
  }
}
