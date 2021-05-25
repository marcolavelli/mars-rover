import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String uri;

  NetworkHelper(this.uri);

  Future<dynamic> getData() async {
    var url = Uri.parse(uri);
    var response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
