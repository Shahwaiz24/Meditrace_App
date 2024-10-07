import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  static String url = "https://meditrace-app-back-end.vercel.app/v1/api/";
  static checkUserForSignUp({required String email, required body}) async {
    try {
      final urlParsing = ApiService.url + "check-user-signup";
      final clientUrl = await Uri.parse(urlParsing);
      var response = await http.post(clientUrl, body: body);

      var responseBody = jsonDecode(response.body);
      if(responseBody['Status'] == 'Failure'){
        
      }
      else{}
    } catch (e) {}
  }
}
