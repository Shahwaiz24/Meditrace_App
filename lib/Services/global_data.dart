class SignUpGlobalData {
  static String finalPhoneNumber = '';
  static String finalEmailAddress = '';
  static String finalPassword = '';

  static String finalBloodGroup = '';
  static String finalWeight = '';
  static String finalHeight = '';
  static List<String> allergies = [];
  static List<String> chronic = [];
  static List emergencyContacts = [];
  static String finalFirstName = "";
  static String finalLastName = "";
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
  static String userId = '';
  static int selectedBottomBarIndex = 0;
  static bool userHomePageCheck = false;
  static Map userData = {};
  static String userFirstName = '';
  static String userLastName = '';
  static String userProfilePhoto = '';
  static List userBag = [];
  static List userEmegerncyContacts = [];
  static List userMedicines = [];
  static String username = "";
}

class MedicineAddingData {
  static String medicinesName = "";
  static bool isAsNeeded = false;
  static String dose1Time = "";
  static String dose2Time = "";
  static bool isDose2Selected = false;

  static bool isSpecific = false;
  static bool isEverday = false;
  static List<String> specificDays = [];

  static String medicinesStrength = "";
  static String medicinesUnit = "";
}
