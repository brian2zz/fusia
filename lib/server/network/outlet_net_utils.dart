
import 'package:http/http.dart' as http;

class OutletNetUtils {

  static var serverUrl = "http://dev.koffiesoft.com/fusia_test";

  static var durationlimit = const Duration(seconds: 30);

  retrieveOutletList(token) async {
    
    var path = "$serverUrl/index.php?c=c_cabang&m=cabang_app_list&limit=15";
    
    Map<String,String> _headers = {
      "Authorization": "Bearer $token",
    };

    var response = await http.get(
      Uri.parse(path),
      headers: _headers,
    ).timeout(durationlimit);

    return response;
  }

  retrieveDetailOutlet(masterId,token) async {

    var path = "$serverUrl/index.php?c=c_cabang&m=cabang_app_list&limit=15&master_id=$masterId";

    Map<String,String> _headers = {
      "Authorization": "Bearer $token",
    };

    var response = await http.get(
      Uri.parse(path),
      headers: _headers,
    ).timeout(durationlimit);

    return response;
  }
}