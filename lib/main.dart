import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/services.dart';
import 'package:flip_card/flip_card.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(canvasColor: Colors.black),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
            height: 210,
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
                Text(
                  "email@gmail.com",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )
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
            title: Text(
              "Karya",
              style: TextStyle(color: Colors.white),
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
          ListTile(
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
            title: Text(
              "Login",
              style: TextStyle(color: Colors.white),
            ),
            leading: Icon(
              Icons.account_circle,
              color: Colors.white,
            ),
          ),
          ListTile(
            title: Text(
              "Logout",
              style: TextStyle(color: Colors.white),
            ),
            leading: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
          )
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
                height: 460,
                width: MediaQuery.of(context).size.width,
                child: Swiper(
                  itemBuilder: (context, index) {
                    return Container(
                        // height: MediaQuery.of(context).size.height,
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
                                            child: Text(
                                              "The dark is rising",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: 'Pacifico',
                                                  color: Colors.white),
                                            ),
                                          ),
                                          Spacer(),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Icon(
                                              Icons.favorite, color: Colors.red, size: 30,
                                            )
                                          ),
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
                                        child: Row(
                                          children: <Widget>[
                                            
                                          ]
                                        )
                                      )
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
                              height: 10,
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
