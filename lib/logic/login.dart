import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> login(String email, String password) async {
  final dataIn = {'email': email, 'password': password};
  final headers = {'Content-Type': 'application/json'};
  final body = jsonEncode(dataIn);

  final response = await http.post(
    Uri.parse('https://cupcar-backend-gvnm-dev.fl0.io/v1/clients/login'),
    headers: headers,
    body: body,
  );

  if (response.statusCode == 200) {
    final responseBody = json.decode(response.body);
    final status = responseBody['status'];
    final data = responseBody['data'];
    return {'status': status, 'data': data};
  } else {
    throw Exception('Failed to login');
  }
}
