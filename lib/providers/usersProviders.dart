import 'dart:convert';

import 'package:designku/models/usersModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UsersProvider extends ChangeNotifier{

  UsersModel usersmodel;
  // List<UsersModel> users;
  // List<UsersModel> get listusers => users;

  // set listusers(List<UsersModel> val){
  //   users = val;
  //   notifyListeners();
  // }

  Future<bool> userStoreLogin(String username, String password) async {
    final url = Uri.parse('http://192.168.43.184:3000/login');
    final response = await http.post(url, body: {
      'username' : username,
      'password' : password
    });

    final data = jsonDecode(response.body)['data'];
    String token = jsonDecode(response.body)['token'];
    bool status = jsonDecode(response.body)['error'];
    
    //get data from api
    for (var i = 0; i < data.length; i++) {
      usersmodel = UsersModel(
        userid: data[i]['id'],
        username: data[i]['username'],
        password: data[i]['password']
      );
    }
    int userid = usersmodel.userid;
    String users = usersmodel.username;
    String passwd = usersmodel.username;
    print(userid);

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