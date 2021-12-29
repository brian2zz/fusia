import 'dart:convert';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:http/http.dart' as http;

class LoginNetUtils {
  static var serverUrl = "http://dev.koffiesoft.com/fusia";

  static var durationlimit = const Duration(seconds: 30);

  requestLoginNetUtils(phone) async {
    Map<String, dynamic> bodyparams = {
      "phone_number": phone,
    };

    var response = await http
        .post(
          Uri.parse("$serverUrl/index.php?c=c_login&m=verify_fusia"),
          body: bodyparams,
        )
        .timeout(durationlimit);

    return response;
  }

  verifyOTPNetUtils(phone, code) async {
    Map<String, dynamic> bodyparams = {
      "phone_number": phone,
      "code": code,
    };

    var response = await http
        .post(
          Uri.parse("$serverUrl/index.php?c=c_login&m=verify_otp"),
          body: bodyparams,
        )
        .timeout(durationlimit);

    return response;
  }

  sendOTPNetUtils(phone) async {
    Map<String, dynamic> bodyparams = {
      "phone_number": phone,
    };

    var response = await http
        .post(
          Uri.parse('$serverUrl/fusia/index.php?c=c_login&m=sendOTP'),
          body: bodyparams,
        )
        .timeout(durationlimit);

    return response;
  }

  requestCreateAccount(paramsdata) async {
    Map<String, dynamic> bodyparams = {
      "cust_nama": paramsdata[0],
      "cust_email": paramsdata[1],
      "cust_tgllahir": paramsdata[2],
      "cust_hp": paramsdata[3],
      "stat_user": "1",
      "cust_app_check": "1",
    };

    var response = await http
        .post(
          Uri.parse("$serverUrl/index.php?c=c_customer&m=customer_create_app"),
          body: bodyparams,
        )
        .timeout(durationlimit);

    return response;
  }
}
