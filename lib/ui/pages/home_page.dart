import 'package:flutter/material.dart';
import 'package:loja/ui/pages/home_tab.dart';

class HomePage extends StatelessWidget {

  final _pageController = PageController();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
           HomeTab(),
      ],
    );
  }
}
