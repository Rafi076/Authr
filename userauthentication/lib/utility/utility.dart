

import 'package:shared_preferences/shared_preferences.dart';

// Write user data to shared preferences
Future<void> writeUserData(userData) async {
  try {
    final prefs = await SharedPreferences.getInstance();

    // Accessing the first element inside 'data' list
    var userInfo = userData['data'][0];

    await prefs.setString('_id', userInfo['_id']);
    await prefs.setString('email', userInfo['email']);
    await prefs.setString('firstName', userInfo['firstName']);
    await prefs.setString('lastName', userInfo['lastName']);
    await prefs.setString('mobile', userInfo['mobile']);

    // Avoid storing passwords in plain text!
    // Consider using encrypted storage if absolutely necessary
    await prefs.setString('token', userData['token']);
    await prefs.setString('createdDate', userInfo['createdDate']);
  } catch (e) {
    print('Error writing user data: $e');
  }
}

// Emailverification
Future<void> WriteEmailVerification(Email) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('EmailVerification', Email);
}
//otp
Future<void> WriteOTPVerification(OTP) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('OTPVerification', OTP);
}


// Read sharePreference -->> it will work for each data like email,name,mobile
Future<String?> ReadUserData(Key) async {
  final prefs = await SharedPreferences.getInstance();
  String? mydata= await prefs.getString(Key);
  return mydata;
}