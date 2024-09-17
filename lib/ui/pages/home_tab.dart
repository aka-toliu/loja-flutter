import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  Widget _buildBodyBack() => Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(colors: [
        Colors.deepOrangeAccent,
        Colors.deepPurpleAccent
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight
      )
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildBodyBack(),
        const CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              flexibleSpace: FlexibleSpaceBar(
                  title: Text('Home', style: TextStyle(color: Colors.white),),
                centerTitle: true,
              ),
            )
          ],
        )
      ],
    );
  }
}
