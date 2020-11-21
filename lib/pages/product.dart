import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_point_tab_bar/pointTabIndicator.dart';

class Product extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product>
    with SingleTickerProviderStateMixin {
  final tabList = ['Tous', 'Géant', 'Carrefour', 'Monoprix'];
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: tabList.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
       // title: Text('Point Tab Bar'),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          indicator: PointTabIndicator(
            position: PointTabIndicatorPosition.bottom,
            color: Colors.white,
            insets: EdgeInsets.only(bottom: 6),
          ),
          tabs: tabList.map((item) {
            return Tab(
              text: item,
            );
          }).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabList.map((item) {
          return Center(child: Text(item));
        }).toList(),
      ),
    );
  }
}