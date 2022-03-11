import 'package:flutter/material.dart';

import '../tabs/home_tab.dart';
import '../tabs/products_tab.dart';
import '../widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          body: const HomeTab(),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          appBar: AppBar(
            title: const Text('Produtos'),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: const ProductsTab(),
        ),
        Container(color: Colors.yellow,),
        Container(color: Colors.green,),
      ],
    );
  }
}