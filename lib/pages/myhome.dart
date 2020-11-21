import 'package:flutter/material.dart';
import 'package:myflutter/CategoriePack/categories_tile.dart';
import 'package:myflutter/components/fryo_icons.dart';
import 'package:google_fonts/google_fonts.dart';


class Myhome extends StatefulWidget {
  @override
  _MyhomeState createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,),
    body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Stack(
            alignment: AlignmentDirectional.topCenter,
            overflow: Overflow.visible,
            children: <Widget>[
              _buildCategories(),
            ],
          ),
        ],
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


              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          _buildCategoriesList(),

        ],
      ),
    );
  }
  Widget _buildCategoriesList() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        GestureDetector(
          child:  CategoriesTile(
            assetPath: 'assets/images/geant.png',
            color: Color(0xffDFECF8),
            title: 'Liquide',
          ),
        ),
        GestureDetector(
          child:  CategoriesTile(
            assetPath: 'assets/images/monoprix.png',
            color: Color(0xffE2F3C2),
            title: 'Frai',
          ),
        ),

        GestureDetector(
          child:  CategoriesTile(
            assetPath: 'assets/images/carrefour.png',
            color: Color(0xffE2F3C2),
            title: 'Frai',
          ),
        ),


      ],
    );
  }

}

