import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Carrefour extends StatefulWidget {
  @override
  _CarrefourState createState() => _CarrefourState();
}

class _CarrefourState extends State<Carrefour> {
  int _currentIndex=0;

  List cardList=[
    Item1(),
    Item2(),
    Item3(),
    Item4()
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Card Carousel App',
      theme: ThemeData(

      ),
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.redAccent,
              //title:Text("Flutter Card Carousel")
          ),
          body: Column(
            children: <Widget>[
              CarouselSlider(
                options: CarouselOptions(
                  height: 200.0,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  pauseAutoPlayOnTouch: true,
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                items: cardList.map((card){
                  return Builder(
                      builder:(BuildContext context){
                        return Container(
                          height: MediaQuery.of(context).size.height*0.30,
                          width: MediaQuery.of(context).size.width,
                          child: Card(
                            color: Colors.white,
                            child: card,
                          ),
                        );
                      }
                  );
                }).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: map<Widget>(cardList, (index, url) {
                  return Container(
                    width: 10.0,
                    height: 10.0,
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == index ? Colors.redAccent : Colors.grey,
                    ),
                  );
                }),
              ),
            ],
          )
      ),
    );
  }
}

class Item1 extends StatelessWidget {
  const Item1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          'assets/images/login.png',
          height: 180.0,
          fit: BoxFit.cover,
        ),

      ],
    );
  }
}

class Item2 extends StatelessWidget {
  const Item2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          'assets/images/login.png',
          height: 180.0,
          fit: BoxFit.cover,
        ),

      ],
    );
  }
}

class Item3 extends StatelessWidget {
  const Item3({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/images/login.png',
            height: 180.0,
            fit: BoxFit.cover,
          ),

    ],
    );
  }
}

class Item4 extends StatelessWidget {
  const Item4({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          'assets/images/login.png',
          height: 180.0,
          fit: BoxFit.cover,
        ),

      ],
    );
  }
}