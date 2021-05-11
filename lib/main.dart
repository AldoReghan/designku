import 'dart:convert';
import 'package:designku/components/appBar.dart';
import 'package:designku/components/drawer.dart';
import 'package:designku/components/flipcart.dart';
import 'package:designku/models/imageModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

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
      theme: ThemeData(
          canvasColor: Colors.black, buttonTheme: ButtonThemeData(height: 60)),
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
  List<ImageModel> imageModels = [];
  bool isLoading = true;
  var refreshKey = GlobalKey<RefreshIndicatorState>();

  Future<void> fetchImage() async {
    final url = Uri.parse(
        "https://api.unsplash.com/photos/?client_id=lx_uNjPRgw1df4pSgwGC8_Li60GQAmCnOH1BGYzO0-g");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      for (var item in data) {
        ImageModel model = ImageModel(
            imageUrl: item['urls']['small'], name: item['user']['name']);
        setState(() {
          imageModels.add(model);
          isLoading = false;
        });
      }
    } else {
      print("error");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: customAppBar(),
      drawer: CustomDrawer(),
      body: RefreshIndicator(
        key: refreshKey,
        onRefresh: fetchImage,
        child: isLoading == true
            ? Center(child: CircularProgressIndicator())
            : SizedBox.expand(
                child: Stack(
                  alignment: Alignment.center,
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Positioned(
                      top: 25,
                      child: Container(
                        height: MediaQuery.of(context).size.height / 1.3,
                        width: MediaQuery.of(context).size.width,
                        child: Swiper(
                          itemCount: imageModels.length,
                          itemBuilder: (context, index) {
                            final data = imageModels[index];
                            return Flipcard(
                              image: data.imageUrl,
                              backjudul: data.name,
                            );
                          },
                          viewportFraction: 0.8,
                          scale: 0.9,
                          // autoplay: true,
                          itemWidth: MediaQuery.of(context).size.width,
                          itemHeight: MediaQuery.of(context).size.height,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
