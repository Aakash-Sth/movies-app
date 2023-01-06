import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ApiService {
  Future<dynamic> getApiData(String uri) async {
    Uri url = Uri.parse(uri);
    final response = await http.get(url);
    final statusCode = response.statusCode;
    if (statusCode != 200 && statusCode != 304) {
      throw HttpException(
        response.body,
      );
    }
    final apiDatas = jsonDecode(response.body);
    return apiDatas;
  }

  Future<dynamic> postData(String uri, Map<String, dynamic> body) async {
    Uri url = Uri.parse(uri);
    final response = await http.post(url, body: body);

    return jsonDecode(response.body);
  }
}
