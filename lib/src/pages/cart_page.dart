import 'package:flutter/material.dart';
import 'package:smart_health_care/src/pages/eshop/eshop_cart_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:smart_health_care/src/theme/light_color.dart';

import 'package:responsive_grid/responsive_grid.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> with TickerProviderStateMixin {
late  TabController _tabController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: 3,vsync: this);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([
              Stack(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height,
                    color: ColorResources.themeRed,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:30.0,left: 15),
                          child: Icon(Icons.keyboard_backspace,
                            size: 20,
                            color: ColorResources.white,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:15,top:15.0,bottom: 10),
                          child: Text('My Cart',
                            style: TextStyle(
                              color: ColorResources.white,
                              fontSize: 18
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: ResponsiveGridRow(
                            children: [
                              ResponsiveGridCol(
                                child: Container(
                                  color: ColorResources.themeRed,
                                  width: MediaQuery.of(context).size.width,
                                  child: TabBar(
                                    indicatorWeight: 3,
                                    unselectedLabelColor: ColorResources.grey,
                                    labelColor: Colors.white,
                                    tabs: [
                                      new Tab(
                                        text: "Lab",),
                                      new Tab(text: "Medicine"),
                                      new Tab(text: "E-shop"),
                                    ],
                                    controller: _tabController,
                                    indicatorColor: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 145,
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width,
                      child: ResponsiveGridRow(
                        children: [
                          ResponsiveGridCol(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width,
                                  child: TabBarView(
                                    controller: _tabController,
                                    children: [
                                      EshopCartScreen(),
                                      EshopCartScreen(),
                                      EshopCartScreen(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          )
        ],
      ),
    )
    ;
  }

}
