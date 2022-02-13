import 'dart:convert';

import 'package:fusia/server/network/login_net_utils.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  LoginNetUtils netutils = Get.put(LoginNetUtils());

  requestLoginController(phone) async {
    var result = await netutils.requestLoginNetUtils(phone);

    Map<String, dynamic> out = {};

    if (result == 'ReqTimeOut') {
      out = {
        "status": 1,
        "details": "Request Time Out",
      };
    } else if (result == "SocketConnProblem") {
      out = {
        "status": 1,
        "details":
            "Koneksi internet anda bermasalah. Silahkan cek jaringan anda kembali.",
      };
    } else if (result.statusCode == 200) {
      out = {
        "status": 200,
        "details": jsonDecode(result.body),
      };
    } else if (result.statusCode == 404) {
      out = {
        "status": 404,
        "details":
            "login gagal dilakukan. Silahkan menghubungi Administrator untuk lebih lanjut.",
      };
    } else {
      out = {
        "status": result.statusCode,
        "details":
            "Terjadi gangguan ketika mengambil data. Silahkan menghubungi Administrator untuk lebih lanjut.",
      };
    }
    return out;
  }

  verifyOTPController(phone, code) async {
    var result = await netutils.verifyOTPNetUtils(phone, code);

    Map<String, dynamic> out = {};

    if (result == 'ReqTimeOut') {
      out = {
        "status": 1,
        "details": "Request Time Out",
      };
    } else if (result == "SocketConnProblem") {
      out = {
        "status": 1,
        "details":
            "Koneksi internet anda bermasalah. Silahkan cek jaringan anda kembali.",
      };
    } else if (result.statusCode == 200) {
      out = {
        "status": 200,
        "details": jsonDecode(result.body),
      };
    } else if (result.statusCode == 404) {
      out = {
        "status": 404,
        "details":
            "login gagal dilakukan. Silahkan menghubungi Administrator untuk lebih lanjut.",
      };
    } else {
      out = {
        "status": result.statusCode,
        "details":
            "Terjadi gangguan ketika mengambil data. Silahkan menghubungi Administrator untuk lebih lanjut.",
      };
    }
    return out;
  }
}
