import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flip_card/flip_card.dart';

class Flipcard extends StatelessWidget {

  final String image;
  final String backjudul;

  const Flipcard({Key key, this.image, this.backjudul}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  image,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                backjudul,
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
                              padding: const EdgeInsets.all(8.0),
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
  }
}
