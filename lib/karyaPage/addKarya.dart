import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Add Karya',
      home: AddKarya(),
    );
  }
}

class AddKarya extends StatefulWidget {
  @override
  _AddKaryaState createState() => _AddKaryaState();
}

class _AddKaryaState extends State<AddKarya> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Karya"),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 7, color: Colors.grey, offset: Offset(0, 5)
                      )]),
                    child: Image.network("http://via.placeholder.com/288x188"),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.collections),
                    hintText: "Nama Karya"
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}