import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meditrace_project/Services/global_data.dart';
import 'package:meditrace_project/Views/Sign%20In%20View/signin_viewmodel.dart';

class ApiService {
  static String url = "https://meditrace-app-backend.vercel.app/v1/api/";

  static updateProfile({required body}) async {
    try {
      final urlParsing = ApiService.url + "update-profile";
      final clientUrl = await Uri.parse(urlParsing);
      var response = await http.post(clientUrl, body: body, headers: {
        "Content-Type": "application/json",
      });

      var responseBody = jsonDecode(response.body);
       if (responseBody['Status'] == 'Success') {
        return true;
      } else {
        print("Response Body : ${responseBody.toString()}");
        return false;
      }
    } catch (e) {
       print("Error : ${e.toString()}");
      return false;
    }
  }

  static changePassword({required body}) async {
    try {
      final urlParsing = ApiService.url + "change-password";
      final clientUrl = await Uri.parse(urlParsing);
      var response = await http.post(clientUrl, body: body, headers: {
        "Content-Type": "application/json",
      });
      var responseBody = jsonDecode(response.body);
      if (responseBody['Status'] == 'Success') {
        return true;
      } else {
        print("Response Body : ${responseBody.toString()}");
        return false;
      }
    } on Exception catch (e) {
      print("Error : ${e.toString()}");
      return false;
    }
  }

  static sendOtp({required body}) async {
    try {
      final urlParsing = ApiService.url + "send-otp";
      final clientUrl = await Uri.parse(urlParsing);
      var response = await http.post(
        clientUrl,
        body: body,
        headers: {
          "Content-Type": "application/json",
        },
      );
      var responseBody = jsonDecode(response.body);

      if (responseBody['Status'] == 'Success') {
        OTPvalue.otp = responseBody["OTP"].toString();
        return true;
      } else {
        print("Response Body : ${responseBody.toString()}");
        return false;
      }
    } catch (e) {
      print("Error : ${e.toString()}");
      return false;
    }
  }

  static checkUserForSignUp({required body}) async {
    try {
      final urlParsing = ApiService.url + "check-user-signup";
      final clientUrl = await Uri.parse(urlParsing);
      var response = await http.post(
        clientUrl,
        body: body,
        headers: {
          "Content-Type": "application/json",
        },
      );

      var responseBody = jsonDecode(response.body);
      if (responseBody['Status'] == 'Failure') {
        return true;
      } else {
        print("Response Body : ${responseBody.toString()}");
        return false;
      }
    } catch (e) {
      print("Error : ${e.toString()}");
      return false;
    }
  }

  static signUpUser({required body}) async {
    try {
      final urlParsing = ApiService.url + "signup";
      final clientUrl = await Uri.parse(urlParsing);
      var response = await http.post(
        clientUrl,
        body: body,
        headers: {
          "Content-Type": "application/json",
        },
      );

      var responseBody = await jsonDecode(response.body);
      if (responseBody['Status'] == 'Success') {
        UserGlobalData.userId = responseBody['Id'];
        print("Body : ${responseBody.toString()}");

        return true;
      } else {
        print("Body : ${responseBody.toString()}");
        return false;
      }
    } catch (e) {
      print("Error : ${e.toString()}");

      return false;
    }
  }

  static loginUser({required body}) async {
    try {
      final urlParsing = ApiService.url + "login";
      final clientUrl = await Uri.parse(urlParsing);
      var response = await http.post(
        clientUrl,
        body: body,
        headers: {
          "Content-Type": "application/json",
        },
      );
      var responseBody = await jsonDecode(response.body);

      if (responseBody['Status'] == 'Success') {
        SigninViewmodel.user_id = responseBody['Id'].toString();
        print(
            "Body : ${responseBody.toString()} | Id : ${SigninViewmodel.user_id}");

        return true;
      } else {
        print("Body : ${responseBody.toString()}");
        return false;
      }
    } catch (e) {
      print("Error : ${e.toString()}");
      return false;
    }
  }

  static getUserData({required body}) async {
    try {
      final urlParsing = ApiService.url + "get-user";
      final clientUrl = await Uri.parse(urlParsing);
      var response = await http.post(
        clientUrl,
        body: body,
        headers: {
          "Content-Type": "application/json",
        },
      );
      var responseBody = await jsonDecode(response.body);
      if (responseBody['Status'] == 'Success') {
        Map body = responseBody['response'];
        final Map userData = {
          "firstname": body['firstname'],
          "lastname": body["lastname"],
          "email": body["email"],
          "password": body["password"],
          "phone_number": body["phone_number"],
          "gender": body["gender"],
          "birthDate": body["birthDate"],
          "bags": body["bags"],
          "medicines": body["medicines"],
          "medical_Information": body["medical Information"],
          "emergencyContacts": body["emergencyContacts"]
        };
        UserGlobalData.userData = userData;
        print("Data : ${UserGlobalData.userData}");

        return true;
      } else {
        print("Body : ${responseBody.toString()}");
        return false;
      }
    } catch (e) {
      print("Error Of Request : ${e.toString()}");
      return false;
    }
  }

  static addMedicine({required body}) async {
    try {
      final urlParsing = ApiService.url + "add-medicine";
      final clientUrl = await Uri.parse(urlParsing);
      var response = await http.post(
        clientUrl,
        body: body,
        headers: {
          "Content-Type": "application/json",
        },
      );
      var responseBody = jsonDecode(response.body);

      if (responseBody["Status"] == "Success") {
        print("Body: ${responseBody.toString()}");
        return true;
      } else {
        print("Body: ${responseBody.toString()}");

        return false;
      }
    } catch (e) {
      print("Error : ${e.toString()}");
      return false;
    }
  }
}
