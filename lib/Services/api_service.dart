import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meditrace_project/Services/global_data.dart';
import 'package:meditrace_project/Views/Sign%20In%20View/signin_viewmodel.dart';

class ApiService {
  static String url = "https://meditrace-app-back-end.vercel.app/v1/api/";
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
        print("Body : ${responseBody.toString()}");

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
}
