import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:level4/http/umodel.dart';

class APIRequest() {
  Future<Map<String, dynamic>> fetchUsers() async {
    final url = Uri.parse("https://jsonplaceholder.typicode.com/users/1");

    final response = await http.get(url, headers: {
     
    });
    if (response.statusCode == 200) {
      Map<String, dynamic> result = jsonDecode(response.body);
      print(result);
      return result;
    } else {
      print("Response: ${response.statusCode}");
      return {};
    }
  }

 static  Future<List<UserInfo>?> fetchListofUsers() async {
    final url = Uri.parse("https://jsonplaceholder.typicode.com/users");

    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> result = jsonDecode(response.body);
      List<UserInfo> users = result
          .map((user) => UserInfo.fromJson(user))
          .toList();

      print(result);
      return users;
    } else {
      print("Response: ${response.statusCode}");
      throw Exception("Error Loading users");
    }
  }

  createUsers() {}
}
