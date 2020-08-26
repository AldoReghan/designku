import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UsersProvider extends ChangeNotifier{
  Future<bool> userStoreLogin(String username, String password) async {
    final url = 'http://192.168.43.184:3000/login';
    final response = await http.post(url, body: {
      'username' : username,
      'password' : password
    });

    final data = jsonDecode(response.body)['data'];
    String token = jsonDecode(response.body)['token'];
    bool status = jsonDecode(response.body)['error'];

    //get data from api
    for (var i = 0; i < data.length; i++) {
      print(data[i]['username']);
    }

    print(token);
    print(status);
    if (status == false) {
      notifyListeners();
      return true;
    }else{
      return false;
    }
  }
}