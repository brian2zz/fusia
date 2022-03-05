import 'dart:convert';

import 'package:http/http.dart' as http;

class PasswordNetUtils {
  static var serverUrl = "http://dev.koffiesoft.com/fusia_test";

  static var durationlimit = const Duration(seconds: 30);

  retrievePassword(token, customerId) async {
    print(token);
    var path = "$serverUrl/index.php?c=c_login&m=change_password";

    var response = await http.get(
      Uri.parse(path),
      headers: {
        "content-type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    print(json.decode(response.body));

    return response;
  }
}
