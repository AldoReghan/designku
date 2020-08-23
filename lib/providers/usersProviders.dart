import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UsersProvider extends ChangeNotifier{
  Future<bool> userStoreLogin(String username, String password) async {
    final url = '';
    final response = await http.post(url, body: {
      'username' : username,
      'password' : password
    });
    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      notifyListeners();
      return true;
    }else{
      return false;
    }
  }
}