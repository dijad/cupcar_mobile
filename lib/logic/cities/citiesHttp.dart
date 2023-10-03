// ignore: file_names
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<Object, dynamic>> getCities() async {
  final headers = {'Content-Type': 'application/json'};

  final response = await http.get(
      Uri.parse('https://cupcar-backend-gvnm-dev.fl0.io/v1/cities'),
      headers: headers);

  if (response.statusCode == 200) {
    final responseBody = json.decode(response.body);
    final status = responseBody['status'];
    final data = responseBody['data'];
    return {'status': status, 'data': data};
  } else {
    throw Exception('Failed to get cities');
  }
}
