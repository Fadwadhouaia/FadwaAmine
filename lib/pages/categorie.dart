import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myflutter/CategoriePack/categories_tile.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Categorie extends StatefulWidget {
  @override
  _CategorieState createState() => _CategorieState();
}

class _CategorieState extends State<Categorie> {
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.gripLines),
          onPressed: () {},
          color: Colors.grey,
          tooltip: 'Menu',
        ),

      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              //Center(child: Image.asset('assets/images/banner.png')),
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
              _buildCategories(),

            ],
          ),
        ),
      ),

    );
  }



  Widget _buildCategories() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Categories',
                  style: GoogleFonts.varelaRound(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),

              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          _buildCategoriesList(),
          SizedBox(
            height: 20,
          ),
          _buildCategoriesList2()
        ],
      ),
    );
  }

  Widget _buildCategoriesList() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
       GestureDetector(
         onTap: (){

         },
         child:CategoriesTile(
           assetPath: 'assets/images/yaourt.png',
           color: Color(0xffFFDBC5),
           title: 'Surgelée',
         ),
       ),
        GestureDetector(
          onTap: (){

          },
          child: CategoriesTile(
            assetPath: 'assets/images/salmon.png',
            color: Color(0xffFCE8A8),
            title: 'Salée',
          ),
        ),
       GestureDetector(
         onTap: (){

         },
         child:  CategoriesTile(
           assetPath: 'assets/images/biscuit.png',
           color: Color(0xffFFE4E1),
           title: 'Sucrée',
         ),
       ),
        // vert 0xffE2F3C2
        // bleu 0xffDFECF8
        //jaune 0xffFCE8A8
        //saumon 0xffFFDBC5
      ],
    );
  }
  Widget _buildCategoriesList2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        GestureDetector(
          onTap: (){

          },
          child: CategoriesTile(
            assetPath: 'assets/images/milk.png',
            color: Color(0xffDFECF8),
            title: 'Liquide',
          ),
        ),
        GestureDetector(
          onTap: (){

          },
          child: CategoriesTile(
            assetPath: 'assets/images/tomate.png',
            color: Color(0xffE2F3C2),
            title: 'Frai',
          ),
        ),
      ],
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
          'assets/images/q.jpg',
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
          'assets/images/r.jpg',
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
          'assets/images/s.jpg',
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
          'assets/images/x.jpg',
          height: 180.0,
          fit: BoxFit.cover,
        ),

      ],
    );
  }
}

