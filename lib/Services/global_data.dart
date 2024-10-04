class SignUpGlobalData {
  static String finalBloodGroup = '';
  static String finalWeight = '';
  static String finalHeight = '';
  static List<String> allergies = [];
  static List<String> chronic = [];
  static String contactName = '';
  static String contactNumber = '';
  static List emergencyContacts = [];
  static String finalFirstName = "";
  static String finalLastName = "";
  static String finalPhoneNumber = '';
  static String finalEmailAddress = '';
  static String finalPassword = '';
  static String finalPrefix = '';
  static String finalGender = '';
  static String finalDateOfBirth = '';
}

// Forgot Password OTP global Value
class OTPvalue {
  static String otp = '';
}
// User Global Data After SignUp or Login //

class UserGlobalData {
  static int selectedBottomBarIndex = 0;
  static bool userHomePageCheck = false;
  static String userFirstName = '';
  static String userLastName = '';
  static String userProfilePhoto = '';
  static List userBag = [];
  static List userEmegerncyContacts = [];
  static List userMedicines = [
    {"medicine_name": "Ibruofen", "time": "5:56 PM"},
    {"medicine_name": "Panadol", "time": "5:55 PM"},
    {"medicine_name": "ICU", "time": "6:08 PM"},
  ];
}
