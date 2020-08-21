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
        backgroundColor: Colors.black,
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
                    child: ClipRect(
                      child: Image.network("http://via.placeholder.com/288x188"),
                    )
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30, left: 30, right: 30),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white)
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.collections),
                      hintText: "Nama Karya",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 30, right: 30),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white)
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Tanggal rilis',
                      icon: Icon(Icons.calendar_today),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
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