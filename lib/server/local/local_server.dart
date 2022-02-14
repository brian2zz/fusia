
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class LocalUtils {

  static var token = "".obs;
  static var customerId = "".obs;
  static var statusLogin = "".obs;

  storeUserLocal(statusLogin,token,customerId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString("is_login", statusLogin);
    prefs.setString("user_token", token);
    prefs.setString("customer_id", customerId);
  }

  retrieveUserLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    token.value = prefs.getString("user_token")!;
    customerId.value = prefs.getString("customer_id")!;
  }

  retrieveIsLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if(prefs.getString("is_login") != null) {
      statusLogin.value = prefs.getString("is_login")!;
    } else {
      statusLogin.value = "";
    }
  }

  clearData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.clear();
  }

}