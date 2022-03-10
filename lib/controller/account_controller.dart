import 'dart:convert';

import 'package:fusia/server/local/local_server.dart';
import 'package:fusia/server/network/login_net_utils.dart';
import 'package:fusia/server/network/password_net_utils.dart';
import 'package:get/get.dart';

class AccountController extends GetxController {
  PasswordNetUtils passwordUtils = Get.put(PasswordNetUtils());
  // LoginNetUtils netutils = Get.put(LoginNetUtils());
  // LocalUtils localUtils = Get.put(LocalUtils());

  // static var customerId = "".obs;
  // static var userToken = "".obs;

  RequestPassword(customerId, oldPassword, newPassword) async {
    var result = await passwordUtils.retrievePassword(
        customerId, oldPassword, newPassword);
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
