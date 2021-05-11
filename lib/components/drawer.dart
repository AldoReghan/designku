import 'package:designku/Page/karyaPage/showKarya.dart';
import 'package:designku/login.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  
  bool _isLoggedIn;
  String email, token;
  int iduser;
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 215,
            child: DrawerHeader(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  radius: 50,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Aldo Reghan Ramadhan",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(
                  height: 5,
                ),
                email != null
                    ? Text(
                        email,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                    : Text("")
              ],
            )),
            color: Colors.blue,
          ),
          ListTile(
            title: Text(
              "Home",
              style: TextStyle(color: Colors.white),
            ),
            leading: Icon(
              Icons.home,
              color: Colors.white,
            ),
          ),
          ListTile(
            title: GestureDetector(
              onTap: () => {
                iduser != null
                    ? print("please login to access karya")
                    : Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ShowKarya()))
              },
              child: Text(
                "Karya",
                style: TextStyle(color: Colors.white),
              ),
            ),
            leading: Icon(
              Icons.image,
              color: Colors.white,
            ),
          ),
          ListTile(
            title: Text(
              "Transaksi",
              style: TextStyle(color: Colors.white),
            ),
            leading: Icon(
              Icons.compare_arrows,
              color: Colors.white,
            ),
          ),
          ListTile(
            title: Text(
              "Favorit",
              style: TextStyle(color: Colors.white),
            ),
            leading: Icon(
              Icons.favorite,
              color: Colors.white,
            ),
          ),
          iduser != null
              ? Container()
              : ListTile(
                  title: Text(
                    "Settings",
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0, left: 8.0),
            child: Divider(
              color: Colors.blue,
              thickness: 0.5,
            ),
          ),
          ListTile(
            title: GestureDetector(
              onTap: () => {
                if (_isLoggedIn == false)
                  {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()))
                  }
                else
                  {
                    // logoutUser()
                  }
              },
              child: _isLoggedIn == false
                  ? Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    )
                  : Text(
                      "Logout",
                      style: TextStyle(color: Colors.white),
                    ),
            ),
            leading: _isLoggedIn == false
                ? Icon(
                    Icons.account_circle,
                    color: Colors.white,
                  )
                : Icon(
                    Icons.exit_to_app,
                    color: Colors.white,
                  ),
          ),
        ],
      ));
  }
}