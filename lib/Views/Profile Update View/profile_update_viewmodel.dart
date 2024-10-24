import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meditrace_project/Components/bottom_sheet.dart';
import 'package:meditrace_project/Services/api_service.dart';
import 'package:meditrace_project/Services/global_data.dart';
import 'package:meditrace_project/Services/image_picker.dart';
import 'package:meditrace_project/Services/utils.dart';
import 'package:meditrace_project/Views/Home%20View/home_view.dart';

class ProfileUpdateViewmodel with ChangeNotifier {
  bool isFocusFirstName = false;
  bool isError = false;
  bool isFocusLastName = false;
  bool isFocusEmail = false;
  bool isFocusPhone = false;
  bool isFocusDateofBirth = false;
  bool isFirstNameNotEmpty = false;
  bool isLastNameNotEmpty = false;
  bool isEmailNotEmpty = false;
  bool isPhoneNotEmpty = false;
  bool isDateofBirthNotEmpty = false;
  bool allFieldFill = false;
  File? selectedImage;
  bool isLoading = false;
  bool imageSelected = false;
  bool isBirthDatePicked = false;
  String SelectedBirth = "";
  navigateToback({required BuildContext context}) {
    isLoading = false;
    isFirstNameNotEmpty = false;
    imageSelected = false;
    isLastNameNotEmpty = false;
    SelectedBirth = "";
    isDateofBirthNotEmpty = false;
    isBirthDatePicked = false;
    isPhoneNotEmpty = false;

    allFieldFill = false;
    Navigator.pop(context);
  }

  saveChangesTap(
      {required BuildContext context,
      required String firstname,
      required String lastname,
      required String email,
      required String phoneNumber,
      required String birth,
      required String userId}) async {
    if (allFieldFill == true) {
      isLoading = true;
      allFieldFill = false;
      notifyListeners();

      // Convert image file to Base64 string
      List<int> imageBytes = await selectedImage!.readAsBytes();
      String base64Image = await base64Encode(imageBytes);

      // Add the Base64 image to the map
      final map = {
        "userId": userId.toString(),
        "userfirstName": firstname.toString(),
        "userlastName": lastname.toString(),
        "userdateOfbirth": birth.toString(),
        "useremail": email.toString(),
        "usernumber": phoneNumber.toString(),
        "image": base64Image,
        "uploadDate":
            "Day :  ${DateTime.now().day.toString()} | Month : ${DateTime.now().month.toString()} | Year : ${DateTime.now().year.toString()}"
      };
      print("Data : ${map}");
      bool apiCheck = true;

      // await ApiService.updateProfile(body: jsonEncode(map));
      if (apiCheck == true) {
        isLoading = false;
        isFirstNameNotEmpty = false;
        imageSelected = false;
        isLastNameNotEmpty = false;
        isDateofBirthNotEmpty = false;
        isPhoneNotEmpty = false;
        isEmailNotEmpty = false;
        isBirthDatePicked = false;
        isDateofBirthNotEmpty = false;
        allFieldFill = false;
        UserGlobalData.selectedBottomBarIndex = 0;
        Navigator.of(context).popUntil((route) => route.isFirst);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeView()),
        );
        notifyListeners();
      } else {
        isLoading = false;
        isFirstNameNotEmpty = false;
        imageSelected = false;
        isLastNameNotEmpty = false;
        isDateofBirthNotEmpty = false;
        isPhoneNotEmpty = false;
        allFieldFill = false;
        notifyListeners();
        isError = true;
        notifyListeners();

        await Future.delayed(Duration(milliseconds: 1500));
        isError = false;
        notifyListeners();
      }
    }
  }

  Widget buildProfileImage(double screenHeight, ProfileUpdateViewmodel model) {
    // Case 1: No profile photo, no selected image
    if (UserGlobalData.userProfilePhoto.isEmpty &&
        model.imageSelected == false) {
      // Default profile icon
      return Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: CircleAvatar(
          maxRadius: screenHeight * 0.060,
          child: ImageIcon(
            const AssetImage(
              'assets/images/icon/bottom_bar_icon/profile.png',
            ),
            size: screenHeight * 0.04,
            color: AppColors.PrimaryBlueColor,
          ),
        ),
      );
    } else if (UserGlobalData.userProfilePhoto.isNotEmpty &&
        model.imageSelected == true) {
      // Show selected image from file
      return Container(
        width: screenHeight * 0.12,
        height: screenHeight * 0.12,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: FileImage(model.selectedImage!),
            fit: BoxFit.cover,
          ),
        ),
      );
    } else if (UserGlobalData.userProfilePhoto.isNotEmpty &&
        model.imageSelected == false) {
      return Container(
        width: screenHeight * 0.12,
        height: screenHeight * 0.12,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: NetworkImage(UserGlobalData.userProfilePhoto),
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    // Case 4: Just show the default icon as a fallback
    else {
      return Container(
        width: screenHeight * 0.12,
        height: screenHeight * 0.12,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: FileImage(model.selectedImage!),
            fit: BoxFit.cover,
          ),
        ),
      );
    }
  }

  Future<XFile?> pickImageFromGallery() async {
    try {
      // Pick the image from gallery using the ImagePicker
      final XFile? image = await ImagePicking.pickImage();

      if (image != null) {
        // Check if the file path is valid
        File file = File(image.path);

        // Check if the file exists
        bool fileExists = await file.exists();

        if (fileExists) {
          // Mark image as selected
          imageSelected = true;

          // Store the selected image as a File
          selectedImage = file;

          // Print details to verify
          print('File selected: ${file.path}');
          print('File size: ${await file.length()} bytes');

          // Notify listeners to update the UI
          notifyListeners();
        } else {
          print('Error: The selected image file does not exist.');
        }
      } else {
        print('No image selected.');
      }

      return image; // Return the XFile (or null if no image was selected)
    } catch (e) {
      // Handle any exceptions or errors
      print('Error selecting image: $e');
      return null; // Return null in case of an error
    }
  }

  Future<XFile?> clickPhoto() async {
    try {
      // Pick the image from gallery using the ImagePicker
      final XFile? image = await ImagePicking.clickImage();

      if (image != null) {
        // Check if the file path is valid
        File file = File(image.path);

        // Check if the file exists
        bool fileExists = await file.exists();

        if (fileExists) {
          // Mark image as selected
          imageSelected = true;

          // Store the selected image as a File
          selectedImage = file;

          // Print details to verify
          print('File selected: ${file.path}');
          print('File size: ${await file.length()} bytes');

          // Notify listeners to update the UI
          notifyListeners();
        } else {
          print('Error: The selected image file does not exist.');
        }
      } else {
        print('No image selected.');
      }

      return image; // Return the XFile (or null if no image was selected)
    } catch (e) {
      // Handle any exceptions or errors
      print('Error selecting image: $e');
      return null; // Return null in case of an error
    }
  }

  void showCustomBottomSheet(BuildContext context,
      {required double screenHeight,
      required double screenWidth,
      required String email,
      required String firstname,
      required String lastname,
      required String phonenumber}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows the bottom sheet to take full height
      backgroundColor: Colors.transparent, // To see the rounded corners effect
      builder: (context) => CustomBottomSheet(
        pickImage: () async {
          var image = await pickImageFromGallery();
          await checkFields(
              firstName: firstname,
              lastName: lastname,
              phone: phonenumber,
              email: email,
              selectedImage: selectedImage,
              birth: SelectedBirth);
          return image;
        }, // Pass the function reference
        clickImage: () async {
          var image = await clickPhoto();
          await checkFields(
              firstName: firstname,
              lastName: lastname,
              phone: phonenumber,
              email: email,
              selectedImage: selectedImage,
              birth: SelectedBirth);
          return image;
        }, // Pass the functi, // Pass the function reference
        screenHeight: screenHeight,
        screenWidth: screenWidth,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
    );
  }

  void onFirstNameFocusChange(bool hasFocus) {
    isFocusFirstName = hasFocus;

    notifyListeners();
  }

  void onFirstLastFocusChange(bool hasFocus) {
    isFocusLastName = hasFocus;

    notifyListeners();
  }

  void onEmailFocusChange(bool hasFocus) {
    isFocusEmail = hasFocus;

    notifyListeners();
  }

  void onPhoneFocusChange(bool hasFocus) {
    isFocusPhone = hasFocus;

    notifyListeners();
  }

  void onDateOfBirthFocusChange(bool hasFocus) {
    isFocusDateofBirth = hasFocus;
    notifyListeners();
  }

  onDateSelect({required String date}) {
    isBirthDatePicked = true;
    SelectedBirth = date;
    notifyListeners();
  }

  void checkFirstNameEmpty({required String firstName}) {
    if (firstName.isNotEmpty) {
      isFirstNameNotEmpty = true;
      print("First Name : ${firstName} | Bool : ${isFirstNameNotEmpty}");
      notifyListeners();
    } else {
      isFirstNameNotEmpty = false;
      print("First Name : ${firstName} | Bool : ${isFirstNameNotEmpty}");
      notifyListeners();
    }
  }

  void checkLastNameEmpty({required String lastName}) {
    if (lastName.isNotEmpty) {
      isLastNameNotEmpty = true;
      print("Last Name : ${lastName} | Bool : ${isLastNameNotEmpty}");
      notifyListeners();
    } else {
      isLastNameNotEmpty = false;
      print("Last Name : ${lastName} | Bool : ${isLastNameNotEmpty}");
      notifyListeners();
    }
  }

  void checkPhoneEmpty({required String phone}) {
    if (phone.isNotEmpty) {
      isPhoneNotEmpty = true;
      print("Phone Number : ${phone} | Bool : ${isPhoneNotEmpty}");
      notifyListeners();
    } else {
      isPhoneNotEmpty = true;
      print("Phone Number : ${phone} | Bool : ${isPhoneNotEmpty}");
      notifyListeners();
    }
  }

  void checkEmailEmpty({required String email}) {
    if (email.isNotEmpty) {
      isEmailNotEmpty = true;
      print("Email : ${email} | Bool : ${isEmailNotEmpty}");
      notifyListeners();
    } else {
      isEmailNotEmpty = true;
      print("Email : ${email} | Bool : ${isEmailNotEmpty}");
      notifyListeners();
    }
  }

  void checkdateBirthEmpty({required String birth}) {
    if (birth.isNotEmpty) {
      isDateofBirthNotEmpty = true;
      print("Email : ${birth} | Bool : ${isDateofBirthNotEmpty}");
      notifyListeners();
    } else {
      isDateofBirthNotEmpty = true;
      print("Email : ${birth} | Bool : ${isDateofBirthNotEmpty}");
      notifyListeners();
    }
  }

  checkFields(
      {required String birth,
      required String firstName,
      required String lastName,
      required String email,
      required File? selectedImage,
      required String phone}) {
    if ((birth.isNotEmpty) &&
        (imageSelected != false) && // Check if the file is not null
        (firstName.isNotEmpty) &&
        (lastName.isNotEmpty) &&
        (email.isNotEmpty) &&
        (email.contains('@') && email.contains(".com")) &&
        (phone.isNotEmpty && phone.length == 10)) {
      allFieldFill = true;
      notifyListeners();
      print("All Good Working");
    } else {
      allFieldFill = false;
      notifyListeners();
      print("All Not Good Working");
    }
  }
}
