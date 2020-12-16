import 'package:http/http.dart' as http;

Future<http.Response> login(String url) async {
  final response = await http.get(url);
  return response;
}
