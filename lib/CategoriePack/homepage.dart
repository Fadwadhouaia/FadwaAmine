import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myflutter/CategoriePack/categories_tile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              Center(child: Image.asset('assets/images/banner.png')),
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
                _ExploreAllButton(
                  onTap: () {},
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          _buildCategoriesList()
        ],
      ),
    );
  }

  Widget _buildCategoriesList() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CategoriesTile(
          assetPath: 'assets/images/bread.png',
          color: Color(0xffFCE8A8),
          title: 'Bakery',
        ),
        CategoriesTile(
          assetPath: 'assets/images/apple.png',
          color: Color(0xffDFECF8),
          title: 'Fruits',
        ),
        CategoriesTile(
          assetPath: 'assets/images/vegetable.png',
          color: Color(0xffE2F3C2),
          title: 'Vegetables',
        ),
        CategoriesTile(
          assetPath: 'assets/images/milk.png',
          color: Color(0xffFFDBC5),
          title: 'Drinks',
        ),
      ],
    );
  }


}

class _ExploreAllButton extends StatelessWidget {
  final Function onTap;
  const _ExploreAllButton({
    Key key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color(0xffE0E6EE),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10)),
        ),
        child: Text(
          'Explore All',
          style: GoogleFonts.varelaRound(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.grey[700]),
        ),
      ),
    );
  }
}
