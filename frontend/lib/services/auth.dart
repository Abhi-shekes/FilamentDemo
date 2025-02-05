import 'dart:convert';
import 'package:http/http.dart' as http;

import '../ip.dart';

class AuthService {

  Future<Map<String, dynamic>> login(String email, String password) async {

    final response = await http.post(
      Uri.parse('$ip/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body); // Parse the response body as JSON
    } else {
      throw Exception('Failed to login');
    }
  }


  
   Future<Map<String, dynamic>> signup(String name, String company, String email, String password) async {
    

    

    final response = await http.post(
      Uri.parse('$ip/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'company': company,
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body); // Parse the response body as JSON
    } else {
      throw Exception('Failed to sign up');
    }
  }

}
