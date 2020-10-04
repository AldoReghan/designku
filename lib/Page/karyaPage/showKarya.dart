import 'package:designku/Page/karyaPage/addKarya.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ShowKarya(),
    );
  }
}

class ShowKarya extends StatefulWidget {
  @override
  _ShowKaryaState createState() => _ShowKaryaState();
}

class _ShowKaryaState extends State<ShowKarya> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Karya",
            style: TextStyle(
              color: Colors.white,
            )),
      ),
      body: Center(
        child: Text(
          'Karya kosong',
          style: TextStyle(color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddKarya()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
