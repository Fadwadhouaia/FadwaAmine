import 'package:flutter/material.dart';
import 'package:myflutter/CategoriePack/categories_tile.dart';
import 'package:myflutter/widgets/widget_home_categories.dart';



class Myhome extends StatefulWidget {
  @override
  _MyhomeState createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {

  final List<int> numbers = [1, 2, 3, 5, 8, 13, 21, 34, 55];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Container(
         padding: EdgeInsets.only(top: 30),
         child: ListView(
           children: [
             _buildCategories(),
             WidgetCategories(),

           ],
         ),
       ),
    );
  }
  Widget _buildCategories() {
    return Padding(
      padding: const EdgeInsets.only( bottom: 50,right: 20,top: 20,left: 20),
      child: Column(
        children: <Widget>[
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
            assetPath: 'assets/images/ge.png',
            color: Color(0xffE2F3C2),
            title: 'Geant',
          ),
        ),
        GestureDetector(
          child:  CategoriesTile(
            assetPath: 'assets/images/mo.png',
            color: Color(0xffFFDBC5),
            title: 'Monoprix',
          ),
        ),

        GestureDetector(
          child:  CategoriesTile(
            assetPath: 'assets/images/ca.png',
            color: Color(0xffDFECF8),
            title: 'Carrefour',
          ),
        ),


      ],
    );
  }


}

