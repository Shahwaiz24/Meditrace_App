import 'package:flutter/material.dart';
import 'package:meditrace_project/Components/bottom_bar.dart';
import 'package:meditrace_project/Components/button.dart';
import 'package:meditrace_project/Services/utils.dart';
import 'package:meditrace_project/Views/Profile%20View/profile_viewmodel.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    final model = Provider.of<ProfileViewmodel>(context, listen: false);
    model.initStateFunction(lbs: 180.0, dateofBirth: '29-09-2000');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ProfileViewmodel>(context, listen: false);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        bottomNavigationBar:
            BottomNavBar(screenHeight: screenHeight, screenWidth: screenWidth),
        body: Consumer<ProfileViewmodel>(builder: (context, model, child) {
          if (model.isLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.PrimaryBlueColor,
              ),
            );
          } else {
            return Stack(
              children: [
                Container(
                  height: screenHeight * 0.5, // 50% of screen height
                  decoration: BoxDecoration(
                    color: AppColors.PrimaryBlueColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(screenWidth * 0.060),
                      bottomRight: Radius.circular(screenWidth * 0.060),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: screenHeight * 0.100,
                      right: screenWidth * 0.060,
                      left: screenWidth * 0.060),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ImageIcon(
                            const AssetImage(
                                'assets/images/icon/notification.png'),
                            size: screenHeight * 0.040,
                            color: AppColors.TextwhiteColor,
                          ),
                          Text(
                            'Profile',
                            style: TextStyle(
                                color: AppColors.TextwhiteColor,
                                fontFamily: 'Poppins Bold',
                                fontSize: screenHeight * 0.020),
                          ),
                          ImageIcon(
                              const AssetImage(
                                  'assets/images/icon/chat_help.png'),
                              size: screenHeight * 0.040,
                              color: AppColors.TextwhiteColor),
                        ],
                      ),
                      SizedBox(
                        height: screenHeight * 0.050,
                      ),
                      Center(
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.AppTextColor1,
                                      width: screenWidth * 0.005),
                                  shape: BoxShape.circle),
                              child: CircleAvatar(
                                maxRadius: screenHeight * 0.070,
                                backgroundColor: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: screenHeight * 0.020,
                            ),
                            Text(
                              'Tanya Sen',
                              style: TextStyle(
                                  color: AppColors.TextwhiteColor,
                                  fontFamily: 'Poppins Semi Bold',
                                  fontSize: screenHeight * 0.020),
                            ),
                            SizedBox(
                              height: screenHeight * 0.005,
                            ),
                            Text(model.userAge,
                                style: TextStyle(
                                    color: AppColors.TextwhiteColor,
                                    fontFamily: 'Poppins Medium',
                                    fontSize: screenHeight * 0.017))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.025,
                      ),
                      ButtonComponent(
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                          ButtonHeight: 0.220,
                          decoration: BoxDecoration(
                              color: AppColors.TextwhiteColor,
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.040)),
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: screenHeight * 0.030,
                                left: screenWidth * 0.090,
                                right: screenWidth * 0.090),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'About me',
                                  style: TextStyle(
                                      color: AppColors.TextblackColor,
                                      fontFamily: 'Poppins Semi Bold',
                                      fontSize: screenHeight * 0.018),
                                ),
                                SizedBox(
                                  height: screenHeight * 0.020,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Row(
                                        children: [
                                          ImageIcon(
                                            const AssetImage(
                                                'assets/images/icon/height_icon.png'),
                                            color: AppColors.PrimaryBlueColor,
                                          ),
                                          SizedBox(
                                            width: screenWidth * 0.015,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    '170.18',
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'Poppins Medium',
                                                        fontSize: screenHeight *
                                                            0.020,
                                                        color: AppColors
                                                            .TextblackColor),
                                                  ),
                                                  Text(
                                                    ' cm',
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'Poppins Medium',
                                                        color: AppColors
                                                            .unFocusPrimaryColor,
                                                        fontSize: screenHeight *
                                                            0.016),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                'Height',
                                                style: TextStyle(
                                                    fontFamily:
                                                        'Poppins Medium',
                                                    color: AppColors
                                                        .unFocusPrimaryColor,
                                                    fontSize:
                                                        screenHeight * 0.018),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: screenWidth * 0.070),
                                      child: Container(
                                        child: Row(
                                          children: [
                                            ImageIcon(
                                              const AssetImage(
                                                  'assets/images/icon/weight.png'),
                                              color: AppColors.PrimaryBlueColor,
                                            ),
                                            SizedBox(
                                              width: screenWidth * 0.015,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      '110',
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'Poppins Medium',
                                                          fontSize:
                                                              screenHeight *
                                                                  0.020,
                                                          color: AppColors
                                                              .TextblackColor),
                                                    ),
                                                    Text(
                                                      ' lbs.',
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'Poppins Medium',
                                                          color: AppColors
                                                              .unFocusPrimaryColor,
                                                          fontSize:
                                                              screenHeight *
                                                                  0.016),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  'Weight',
                                                  style: TextStyle(
                                                      fontFamily:
                                                          'Poppins Medium',
                                                      color: AppColors
                                                          .unFocusPrimaryColor,
                                                      fontSize:
                                                          screenHeight * 0.018),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: screenHeight * 0.020,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Row(
                                        children: [
                                          ImageIcon(
                                            const AssetImage(
                                                'assets/images/icon/body.png'),
                                            color: AppColors.PrimaryBlueColor,
                                          ),
                                          SizedBox(
                                            width: screenWidth * 0.015,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    model.weightinKg,
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'Poppins Medium',
                                                        fontSize: screenHeight *
                                                            0.020,
                                                        color: AppColors
                                                            .TextblackColor),
                                                  ),
                                                  Text(
                                                    ' kg/m2',
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'Poppins Medium',
                                                        color: AppColors
                                                            .unFocusPrimaryColor,
                                                        fontSize: screenHeight *
                                                            0.016),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                'BMI',
                                                style: TextStyle(
                                                    fontFamily:
                                                        'Poppins Medium',
                                                    color: AppColors
                                                        .unFocusPrimaryColor,
                                                    fontSize:
                                                        screenHeight * 0.018),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          ImageIcon(
                                            const AssetImage(
                                                'assets/images/icon/blood.png'),
                                            color: AppColors.PrimaryBlueColor,
                                          ),
                                          SizedBox(
                                            width: screenWidth * 0.015,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    'O+',
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'Poppins Medium',
                                                        fontSize: screenHeight *
                                                            0.020,
                                                        color: AppColors
                                                            .TextblackColor),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                'Blood Type',
                                                style: TextStyle(
                                                    fontFamily:
                                                        'Poppins Medium',
                                                    color: AppColors
                                                        .unFocusPrimaryColor,
                                                    fontSize:
                                                        screenHeight * 0.018),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )),
                   SizedBox()
                   
                    ],
                  ),
                )
              ],
            );
          }
        }));
  }
}
