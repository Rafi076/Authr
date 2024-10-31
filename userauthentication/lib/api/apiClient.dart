import 'dart:convert';
import 'package:http/http.dart' as http;

import '../style/style.dart';
import '../utility/utility.dart';

var BaseURL="http://35.73.30.144:2005/api/v1";   // Task Manger --> BaseUrl
var RequestHeader={"Content-Type":"application/json"}; // Login --> Header --> content type


// gmail already reg :-->> mohiuddinrafi076@gmail.com
// pass:             -->> 123456789

Future<bool> LoginRequest(FormValues) async{

  try {
    var url = Uri.parse("${BaseURL}/login");
    var postBody = json.encode(FormValues);

    var response = await http.post(
      url,
      headers: RequestHeader,
      body: postBody,
    );

    var resultCode = response.statusCode;
    var resultBody = json.decode(response.body);

    if (resultCode == 200 && resultBody['status'] == "success") {
      SuccessToast("Request Success");

      await writeUserData(resultBody);

      return true;
    } else {
      ErrorToast(resultBody['message'] ?? "Registration failed! Try again.");
      ErrorToast("Server error: ${response.statusCode}");
      return false;
    }
  } catch (e) {
    ErrorToast("An error occurred: $e");
    return false;
  }
}





Future<bool> RegistrationRequest(FormValues) async{
  try{
    var URL=Uri.parse("${BaseURL}/registration");
    var PostBody=json.encode(FormValues);

    var response= await  http.post(URL,headers:RequestHeader,body: PostBody);

    var resultCode=response.statusCode;
    var resultBody=json.decode(response.body);

    if(resultCode==200 && resultBody['status']=="success"){
      SuccessToast("Request Success");
      return true;
    }
    else{
      ErrorToast(resultBody['message'] ?? "Registration failed! Try again.");
      ErrorToast("Server error: ${response.statusCode}");
      return false;
    }
  }catch (e) {
    ErrorToast("An error occurred: $e");
    return false;
  }
}






Future<bool> VerifyEmailRequest(Email) async{
  try{
    var URL=Uri.parse("${BaseURL}/RecoverVerifyEmail/${Email}");
    var response= await http.get(URL,headers:RequestHeader);

    var resultCode=response.statusCode;
    var resultBody=json.decode(response.body);

    if(resultCode==200 && resultBody['status']=="success"){

      await WriteEmailVerification(Email);

      SuccessToast("Request Success");
      return true;
    }
    else{
      ErrorToast(resultBody['message'] ?? "Verifying request failed! Try again.");
      ErrorToast("Server error: ${response.statusCode}");
      return false;
    }
  }catch (e) {
    ErrorToast("An error occurred: $e");
    return false;
  }
}






Future<bool> VerifyOTPRequest(Email,OTP) async{
  try{
    var URL=Uri.parse("${BaseURL}/RecoverVerifyOTP/${Email}/${OTP}");
    var response= await  http.get(URL,headers:RequestHeader);

    var resultCode=response.statusCode;
    var resultBody=json.decode(response.body);

    if(resultCode==200 && resultBody['status']=="success"){

      await WriteOTPVerification(OTP);

      SuccessToast("Request Success");
      return true;
    }
    else{
      ErrorToast(resultBody['message'] ?? "Verifying OTP failed! Try again.");
      ErrorToast("Server error: ${response.statusCode}");
      return false;
    }
  }catch (e) {
    ErrorToast("An error occurred: $e");
    return false;
  }
}





Future<bool> SetPasswordRequest(FormValues) async {
  try {
    var URL = Uri.parse("${BaseURL}/RecoverResetPassword");
    var PostBody = json.encode(FormValues);

    var response = await http.post(URL, headers: RequestHeader, body: PostBody);
    var resultCode = response.statusCode;
    var resultBody = json.decode(response.body);

    if (resultCode == 200 && resultBody['status'] == "success") {
      SuccessToast("Password Reset Successful");
      return true;
    } else {
      ErrorToast(resultBody['message'] ?? "Password reset failed! Try again.");
      ErrorToast("Server error: $resultCode");
      return false;
    }
  } catch (e) {
    ErrorToast("An error occurred: $e");
    return false;
  }
}




