import 'package:designku/Page/karyaPage/showKarya.dart';
import 'package:designku/login.dart';
import 'package:designku/providers/usersProviders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/services.dart';
import 'package:flip_card/flip_card.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<UsersProvider>.value(
            value: UsersProvider(),
          )
        ],
        child: MaterialApp(
          theme: ThemeData(canvasColor: Colors.black),
          home: Home(),
          debugShowCheckedModeBanner: false,
        ));
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  SharedPreferences sharedPreferences;

  bool _isLoggedIn;
  String email, token;
  int iduser;

  checkloginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      iduser = sharedPreferences.get("iduser");
      email = sharedPreferences.get("email");
      token = sharedPreferences.get("token");
    });
    if (token == null && iduser == null) {
      setState(() {
        _isLoggedIn = false;
      });
      print("Anda belum login");
    } else {
      setState(() {
        _isLoggedIn = true;
      });
      print("Anda sudah login");
    }
  }

  logoutUser() {
    sharedPreferences.clear();
    sharedPreferences.commit();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Home()), (route) => false);
  }

  @override
  void initState() {
    super.initState();
    checkloginStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Designku",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white, fontSize: 35, fontFamily: 'Sacramento'),
        ),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
          )
        ],
      ),
      drawer: Drawer(
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
                iduser == null
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
          iduser == null
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
                  {logoutUser()}
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
      )),
      body: SizedBox.expand(
        child: Stack(
          alignment: Alignment.center,
          overflow: Overflow.visible,
          children: <Widget>[
            Positioned(
              top: 20,
              child: Container(
                height: MediaQuery.of(context).size.height / 1.4,
                width: MediaQuery.of(context).size.width,
                child: Swiper(
                  itemBuilder: (context, index) {
                    return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: FlipCard(
                            front: GestureDetector(
                              onDoubleTap: () => print("object"),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  "http://via.placeholder.com/288x188",
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            back: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.white)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "The dark is rising",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontFamily: 'Pacifico',
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          Spacer(),
                                          Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Icon(
                                                Icons.favorite_border,
                                                color: Colors.white,
                                                size: 30,
                                              )),
                                        ],
                                      ),
                                      Divider(
                                        thickness: 0.5,
                                        color: Colors.blue,
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                              height: 300,
                                              color: Colors.white,
                                              child: ListView())),
                                      Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Row(children: <Widget>[]))
                                    ],
                                  ),
                                ))));
                  },
                  itemCount: 3,
                  viewportFraction: 0.8,
                  scale: 0.9,
                  // autoplay: true,
                  itemWidth: MediaQuery.of(context).size.width,
                  itemHeight: MediaQuery.of(context).size.height,
                ),
              ),
            ),
            SizedBox.expand(
              child: DraggableScrollableSheet(
                  initialChildSize: 0.10,
                  minChildSize: 0.10,
                  maxChildSize: 0.5,
                  builder: (BuildContext c, s) {
                    return Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(color: Colors.grey, blurRadius: 10)
                          ]),
                      child: ListView(
                        controller: s,
                        children: <Widget>[
                          Center(
                            child: Container(
                              height: 8,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10),
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.blue)),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: Colors.white,
                                    ),
                                    hintText: "Cari Kategori...",
                                    hintStyle: TextStyle(color: Colors.white),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              "Kategori",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Pacifico'),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 50,
                              // color: Colors.white,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: <Widget>[
                                  Container(
                                      width: 100,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                          child: Text(
                                        "Web Design",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.white),
                                      ))),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                      width: 100,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                          child: Text(
                                        "Poster",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.white),
                                      ))),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                      width: 100,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                          child: Text(
                                        "Gift Card",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.white),
                                      ))),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                      width: 100,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                          child: Text(
                                        "Mobile Design",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.white),
                                      ))),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
