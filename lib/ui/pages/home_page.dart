import 'package:flutter/material.dart';
import 'package:loja/ui/pages/home_tab.dart';
import 'package:loja/ui/pages/products_tab.dart';

import '../widgets/custom_drawer.dart';

class HomePage extends StatelessWidget {

  final _pageController = PageController();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      /*physics: const NeverScrollableScrollPhysics(),*/
      children: [
           Scaffold(
               body: const HomeTab(),
               drawer: CustomDrawer(pageController: _pageController,),
           ),
          Scaffold(
            appBar: AppBar(
              title: const Text('Produtos', style: TextStyle(
                color: Colors.white
              ),),
              centerTitle: true,
              backgroundColor: Colors.blue,
            ),
            drawer: CustomDrawer(pageController: _pageController,),
            body: const ProductsTab(),
          ),
          Container(color: Colors.redAccent,),
          Container(color: Colors.greenAccent,),
      ],
    );
  }
}
