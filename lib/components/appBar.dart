import 'package:flutter/material.dart';

customAppBar(){
  return AppBar(
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
          child: GestureDetector(
            onTap: (){
              print('cart');
            },
            child: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
}
