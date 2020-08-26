// import 'package:designku/main.dart';
import 'package:designku/providers/usersProviders.dart';
import 'package:designku/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LoginPage',
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

  final GlobalKey<FormBuilderState> _key = GlobalKey<FormBuilderState>();

  void submit(BuildContext context) {
    Provider.of<UsersProvider>(context, listen: false)
        .userStoreLogin(username.text, password.text)
        .then((res) {
      if (res) {
        print("success");
        // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Home()));
        // setState(() {
        //   print("success");
        //   // Navigator.of(context).pushAndRemoveUntil(
        //   //     MaterialPageRoute(builder: (context) => Home()),
        //   //     (route) => false);
        // });
      } else {
        print("error");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FormBuilder(
        key: _key,
        child: Center(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Text(
                    "designku",
                    style: TextStyle(
                        fontFamily: 'Sacramento',
                        fontSize: 50,
                        color: Colors.white),
                  ),
                  Text(
                    "the place where you can do something",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 30, left: 30, right: 30),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white)),
                      child: TextFormField(
                        controller: username,
                        decoration: InputDecoration(
                            hintText: 'Username or Email',
                            hintStyle: TextStyle(color: Colors.grey),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 30, right: 30),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white)),
                      child: TextFormField(
                        controller: password,
                        decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Colors.grey),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.white,
                            ),
                            suffixIcon: Icon(
                              Icons.visibility,
                              color: Colors.blue,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 30, right: 30),
                    child: GestureDetector(
                      onTap: () {
                        submit(context);
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            "LOGIN",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 20, left: 30, right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have account? ",
                            style: TextStyle(color: Colors.white),
                          ),
                          GestureDetector(
                            onTap: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterPage()))
                            },
                            child: Text(
                              "Register Now",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontStyle: FontStyle.italic),
                            ),
                          )
                        ],
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
