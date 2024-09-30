import 'package:flutter/material.dart';
import 'package:meditrace_project/Services/utils.dart';
import 'package:meditrace_project/Views/Forgot%20Password%20Views/Password%20Changed%20View/password_changed_viewmodel.dart';
import 'package:provider/provider.dart';

class PasswordChangedView extends StatefulWidget {
  const PasswordChangedView({super.key, required this.isError});
  final bool isError;
  @override
  State<PasswordChangedView> createState() => _PasswordChangedViewState();
}

class _PasswordChangedViewState extends State<PasswordChangedView> {
  @override
  void initState() {
    final model = Provider.of<PasswordChangedViewModel>(context, listen: false)
        .showPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.ScaffoldColor,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Consumer<PasswordChangedViewModel>(
          builder: (context, model, child) {
            return model.animatedWidget(
                screenHeight: screenHeight,
                screenWidth: screenWidth,
                isError: widget.isError,
                context: context);
          },
        ),
      ),
    );
  }
}
