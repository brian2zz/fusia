
import 'dart:convert';

import 'package:http/http.dart' as http;

class DashboardNetUtils {

  static var serverUrl = "http://dev.koffiesoft.com/fusia";

  static var durationlimit = const Duration(seconds: 30);

  retrieveHomeDashboard(token,customerId) async {
    print(token);
    final String path = "$serverUrl/index.php?c=c_customer&m=customer_app_list";

    var response;

    Map<String,dynamic> map = {
      "cust_id": int.parse(customerId),
    };

    response = await http.post(
      Uri.parse(path),
      headers: {
        "content-type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode(map),
    );

    print(json.decode(response.body));

    return response;
  }
}