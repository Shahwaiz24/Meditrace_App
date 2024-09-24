// ignore_for_file: prefer_is_empty

import 'package:flutter/material.dart';
import 'package:meditrace_project/Components/bottom_bar.dart';
import 'package:meditrace_project/Components/button.dart';
import 'package:meditrace_project/Components/gridview_medicines.dart';
import 'package:meditrace_project/Services/global_data.dart';
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
                  child: SingleChildScrollView(
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
                              Text("${model.userAge} Years",
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
                                                          fontSize:
                                                              screenHeight *
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
                                                          fontSize:
                                                              screenHeight *
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
                                                color:
                                                    AppColors.PrimaryBlueColor,
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
                                                        fontSize: screenHeight *
                                                            0.018),
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
                                                          fontSize:
                                                              screenHeight *
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
                                                          fontSize:
                                                              screenHeight *
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
                                                          fontSize:
                                                              screenHeight *
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
                                  ),
                                ],
                              ),
                            )),
                        Consumer(builder: (context, model, child) {
                          if (UserGlobalData.userMedicines.length >= 4) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: screenHeight * 0.025,
                                ),
                                Text(
                                  'My Medicines',
                                  style: TextStyle(
                                      color: AppColors.TextblackColor,
                                      fontFamily: 'Poppins Semi Bold',
                                      fontSize: screenHeight * 0.018),
                                ),
                                SizedBox(
                                  height: screenHeight * 0.025,
                                ),
                              ],
                            );
                          } else {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: screenHeight * 0.025,
                                ),
                                Text(
                                  'My Medicines',
                                  style: TextStyle(
                                      color: AppColors.TextblackColor,
                                      fontFamily: 'Poppins Semi Bold',
                                      fontSize: screenHeight * 0.018),
                                ),
                                SizedBox(
                                  height: screenHeight * 0.025,
                                ),
                                SizedBox(
                                  height: screenHeight * 0.200,
                                  child: GridviewMedicines(
                                      screenHeight: screenHeight,
                                      screenWidth: screenWidth),
                                ),
                                SizedBox(
                                  height: screenHeight * 0.025,
                                ),
                              ],
                            );
                          }
                        }),
                        Consumer<ProfileViewmodel>(
                            builder: (context, model, child) {
                          if (UserGlobalData.userEmegerncyContacts.length !=
                              0) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: screenHeight * 0.025,
                                ),
                                Text(
                                  'Emergency Contacts',
                                  style: TextStyle(
                                      color: AppColors.TextblackColor,
                                      fontFamily: 'Poppins Semi Bold',
                                      fontSize: screenHeight * 0.018),
                                ),
                                SizedBox(
                                  height: screenHeight * 0.025,
                                ),
                                ListView.builder(
                                    itemCount: SignUpGlobalData
                                        .emergencyContacts.length,
                                    itemBuilder: (context, index) {
                                      return ButtonComponent(
                                          screenHeight: screenHeight,
                                          screenWidth: screenWidth,
                                          ButtonHeight: 0.080,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      screenWidth * 0.040),
                                              color: AppColors.PrimaryBlueColor
                                                  .withOpacity(0.1)),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: screenWidth * 0.040,
                                                right: screenWidth * 0.040),
                                            child: Row(
                                              children: [
                                                ImageIcon(
                                                  const AssetImage(
                                                      'assets/images/icon/bottom_bar_icon/profile.png'),
                                                  color: AppColors
                                                      .PrimaryBlueColor,
                                                  size: screenHeight * 0.040,
                                                ),
                                                SizedBox(
                                                  width: screenWidth * 0.020,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      SignUpGlobalData
                                                              .emergencyContacts[
                                                          index]["contact_name"],
                                                      style: TextStyle(
                                                          color: AppColors
                                                              .TextblackColor,
                                                          fontFamily:
                                                              'Poppins Semi Bold',
                                                          fontSize:
                                                              screenHeight *
                                                                  0.016),
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          screenHeight * 0.005,
                                                    ),
                                                    Text(
                                                        SignUpGlobalData
                                                                    .emergencyContacts[
                                                                index]
                                                            ["contact_number"],
                                                        style: TextStyle(
                                                            color: AppColors
                                                                .unFocusPrimaryColor,
                                                            fontFamily:
                                                                'Poppins Regular',
                                                            fontSize:
                                                                screenHeight *
                                                                    0.015))
                                                  ],
                                                ),
                                                const Spacer(),
                                                Icon(
                                                  Icons.edit_outlined,
                                                  color: AppColors
                                                      .PrimaryBlueColor,
                                                  size: screenHeight * 0.03,
                                                )
                                              ],
                                            ),
                                          ));
                                    })
                              ],
                            );
                          } else {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: screenHeight * 0.025,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Emergency Contacts',
                                      style: TextStyle(
                                          color: AppColors.TextblackColor,
                                          fontFamily: 'Poppins Semi Bold',
                                          fontSize: screenHeight * 0.018),
                                    ),
                                    const Spacer(),
                                    InkWell(
                                      child: Icon(
                                        Icons.add_box_rounded,
                                        color: AppColors.PrimaryBlueColor,
                                        size: screenHeight * 0.030,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: screenHeight * 0.030,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: screenWidth * 0.040,
                                      right: screenWidth * 0.040),
                                  child: Container(
                                    height: screenHeight * 0.090,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            screenWidth * 0.040),
                                        color: AppColors.PrimaryBlueColor
                                            .withOpacity(0.1)),
                                    child: Center(
                                      child: Text(
                                        'Provide a reliable person to contact in\n             case of an emergency.',
                                        style: TextStyle(
                                            color: AppColors.TextblackColor,
                                            fontFamily: "Poppins Regular",
                                            fontSize: screenHeight * 0.018),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }
                        }),
                        SizedBox(
                          height: screenHeight * 0.020,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: screenHeight * 0.020,
                              left: screenWidth * 0.050,
                              right: screenWidth * 0.050),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ButtonComponent(
                                screenHeight: screenHeight,
                                screenWidth: screenWidth,
                                ButtonHeight: 0.060,
                                decoration: BoxDecoration(
                                  color: AppColors.BagContainer,
                                  borderRadius: BorderRadius.circular(
                                      screenWidth * 0.040),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.100),
                                  child: Center(
                                    child: Text(
                                      'Settings',
                                      style: TextStyle(
                                        color: AppColors.TextwhiteColor,
                                        fontFamily: 'Poppins Semi Bold',
                                        fontSize: screenHeight * 0.018,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              ButtonComponent(
                                screenHeight: screenHeight,
                                screenWidth: screenWidth,
                                ButtonHeight: 0.060,
                                decoration: BoxDecoration(
                                  color: AppColors.BagContainer,
                                  borderRadius: BorderRadius.circular(
                                      screenWidth * 0.040),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.100),
                                  child: Center(
                                    child: Text(
                                      'Settings',
                                      style: TextStyle(
                                        color: AppColors.TextwhiteColor,
                                        fontFamily: 'Poppins Semi Bold',
                                        fontSize: screenHeight * 0.018,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: screenHeight * 0.020,
                              left: screenWidth * 0.050,
                              right: screenWidth * 0.050),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ButtonComponent(
                                screenHeight: screenHeight,
                                screenWidth: screenWidth,
                                ButtonHeight: 0.060,
                                decoration: BoxDecoration(
                                  color: AppColors.BagContainer,
                                  borderRadius: BorderRadius.circular(
                                      screenWidth * 0.040),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.100),
                                  child: Center(
                                    child: Text(
                                      'Settings',
                                      style: TextStyle(
                                        color: AppColors.TextwhiteColor,
                                        fontFamily: 'Poppins Semi Bold',
                                        fontSize: screenHeight * 0.018,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              ButtonComponent(
                                screenHeight: screenHeight,
                                screenWidth: screenWidth,
                                ButtonHeight: 0.060,
                                decoration: BoxDecoration(
                                  color: AppColors.BagContainer,
                                  borderRadius: BorderRadius.circular(
                                      screenWidth * 0.040),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.100),
                                  child: Center(
                                    child: Text(
                                      'Settings',
                                      style: TextStyle(
                                        color: AppColors.TextwhiteColor,
                                        fontFamily: 'Poppins Semi Bold',
                                        fontSize: screenHeight * 0.018,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.080,
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          }
        }));
  }
}
