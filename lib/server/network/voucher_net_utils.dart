import 'dart:convert';

import 'package:http/http.dart' as http;

class VoucherNetUtils {
  static var serverUrl = "http://dev.koffiesoft.com/fusia_test";

  static var durationlimit = const Duration(seconds: 30);

  retrieveVoucher(token, customerId) async {
    print(token);
    var path =
        "$serverUrl//index.php?c=c_voucher&m=voucher_list&limit=100&cust_id=$customerId";

    var response = await http.get(
      Uri.parse(path),
      headers: {
        "content-type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    // print(json.decode(response.body));

    return response;
  }
}
