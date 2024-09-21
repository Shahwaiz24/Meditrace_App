import 'package:flutter/material.dart';
import 'package:meditrace_project/Components/button.dart';
import 'package:meditrace_project/Services/global_Data.dart';
import 'package:meditrace_project/Services/utils.dart';
import 'package:meditrace_project/Views/Sign%20Up%20View/Sign%20Up%20Completed/signup_completed_viewmodel.dart';
import 'package:provider/provider.dart';

class SignupCompletedView extends StatelessWidget {
  const SignupCompletedView({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<SignupCompletedViewmodel>(context, listen: false);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: AppColors.ScaffoldColor,
        body: Consumer<SignupCompletedViewmodel>(
            builder: (context, model, child) {
          return model.isLoading == true
              ? Center(
                  child: CircularProgressIndicator(
                    color: AppColors.PrimaryBlueColor,
                  ),
                )
              : model.isError == true
                  ? Padding(
                      padding: EdgeInsets.only(
                        bottom: screenHeight * 0.070,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Spacer(),
                          Container(
                            child: const Stack(
                              alignment: Alignment.center,
                              children: [
                                Image(
                                  image: AssetImage(
                                      'assets/images/image_back.png'),
                                ),
                                Image(
                                  image: AssetImage(
                                      'assets/images/final_error.png'),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "Emergency Contact\n             Not Added!",
                            style: TextStyle(
                                color: AppColors.TextblackColor,
                                fontFamily: "Poppins Bold",
                                fontSize: screenHeight * 0.025),
                          ),
                          SizedBox(
                            height: screenHeight * 0.020,
                          ),
                          Text(
                            'An Error Occured While Creating\n                 Your Profile.',
                            style: TextStyle(
                                color: AppColors.unFocusPrimaryColor,
                                fontSize: screenHeight * 0.020,
                                fontFamily: "Poppins Light"),
                          ),
                          const Spacer(),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.070),
                            child: InkWell(
                              onTap: () {
                                model.onTryAgainTap(context: context);
                              },
                              child: ButtonComponent(
                                screenHeight: screenHeight,
                                screenWidth: screenWidth,
                                ButtonHeight: 0.075,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        screenWidth * 0.080),
                                    color: AppColors.PrimaryBlueColor),
                                child: Center(
                                  child: Text(
                                    'Try Again',
                                    style: TextStyle(
                                        color: AppColors.TextwhiteColor,
                                        fontFamily: 'Poppins Semi Bold',
                                        fontSize: screenHeight * 0.020),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.only(
                        bottom: screenHeight * 0.070,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Spacer(),
                          Image(
                            image: AssetImage(
                                'assets/images/signUp_completed_image.png'),
                          ),
                          Text(
                            "Emergency Contact\n               Added!",
                            style: TextStyle(
                                color: AppColors.TextblackColor,
                                fontFamily: "Poppins Bold",
                                fontSize: screenHeight * 0.025),
                          ),
                          SizedBox(
                            height: screenHeight * 0.020,
                          ),
                          Text(
                            'Your emergency contact information\n    has been successfully updated.',
                            style: TextStyle(
                                color: AppColors.unFocusPrimaryColor,
                                fontSize: screenHeight * 0.020,
                                fontFamily: "Poppins Light"),
                          ),
                          const Spacer(),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.070),
                            child: InkWell(
                              onTap: () {
                                model.onContinueOntap(
                                    context: context,
                                    isSetupLater: false,
                                    userFirstName:
                                        SignUpGlobalData.finalFirstName,
                                    userLastName:
                                        SignUpGlobalData.finalLastName,
                                    userEmailAddress:
                                        SignUpGlobalData.finalEmailAddress,
                                    userPhoneNumber:
                                        SignUpGlobalData.finalPhoneNumber,
                                    userGender: SignUpGlobalData.finalGender,
                                    userPrefix: SignUpGlobalData.finalPrefix,
                                    userDateofBirth:
                                        SignUpGlobalData.finalDateOfBirth,
                                    userPassword:
                                        SignUpGlobalData.finalPassword,
                                    userBloodGroup:
                                        SignUpGlobalData.finalBloodGroup,
                                    userHeight: SignUpGlobalData.finalHeight,
                                    userWeight: SignUpGlobalData.finalWeight,
                                    userKnownAllergies:
                                        SignUpGlobalData.allergies,
                                    userChronicCondition:
                                        SignUpGlobalData.chronic,
                                    userEmergency: [
                                      {
                                        "Contact Name":
                                            SignUpGlobalData.contactName,
                                        "Contact Number":
                                            SignUpGlobalData.contactNumber
                                      }
                                    ]);
                              },
                              child: ButtonComponent(
                                screenHeight: screenHeight,
                                screenWidth: screenWidth,
                                ButtonHeight: 0.075,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        screenWidth * 0.080),
                                    color: AppColors.PrimaryBlueColor),
                                child: Center(
                                  child: Text(
                                    'Continue',
                                    style: TextStyle(
                                        color: AppColors.TextwhiteColor,
                                        fontFamily: 'Poppins Semi Bold',
                                        fontSize: screenHeight * 0.020),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
        }));
  }
}
