import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meditrace_project/Components/bottom_sheet.dart';
import 'package:meditrace_project/Services/global_data.dart';
import 'package:meditrace_project/Services/image_picker.dart';
import 'package:meditrace_project/Services/utils.dart';

class ProfileUpdateViewmodel with ChangeNotifier {
  bool isFocusFirstName = false;
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
  bool imageSelected = false;
  navigateToback({required BuildContext context}) {
    isFirstNameNotEmpty = false;
    imageSelected = false;
    isLastNameNotEmpty = false;
    isDateofBirthNotEmpty = false;
    isPhoneNotEmpty = false;
    allFieldFill = false;
    Navigator.pop(context);
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
    }

    else if (UserGlobalData.userProfilePhoto.isNotEmpty &&
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
    }

    else if (UserGlobalData.userProfilePhoto.isNotEmpty &&
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
      {required double screenHeight, required double screenWidth}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows the bottom sheet to take full height
      backgroundColor: Colors.transparent, // To see the rounded corners effect
      builder: (context) => CustomBottomSheet(
        pickImage: pickImageFromGallery, // Pass the function reference
        clickImage: clickPhoto, // Pass the function reference
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

  void checkFields(
      {required String birth,
      required String firstName,
      required String lastName,
      required String email,
      required File selectedImage,
      required String phone}) {
    if ((birth.isNotEmpty) &&
        (selectedImage != null) && // Check if the file is not null
        (selectedImage.existsSync()) && // Check if the file exists
        (selectedImage.lengthSync() > 0) &&
        (firstName.isNotEmpty) &&
        (lastName.isNotEmpty) &&
        (email.isNotEmpty) &&
        (email.contains('@') && email.contains(".com")) &&
        (phone.isNotEmpty && phone.length == 10)) {
      allFieldFill = true;
      notifyListeners();
    } else {
      allFieldFill = false;
      notifyListeners();
    }
  }
}
