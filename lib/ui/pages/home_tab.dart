import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';

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
        CustomScrollView(
          slivers: [
            const SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              flexibleSpace: FlexibleSpaceBar(
                  title: Text('Home', style: TextStyle(color: Colors.white),),
                centerTitle: true,
              ),
            ),
            FutureBuilder<QuerySnapshot>(
                future: FirebaseFirestore.instance.collection('home').orderBy('pos').get(),
                builder: (context, snapshot){
                  if(!snapshot.hasData){
                    return SliverToBoxAdapter(
                      child: Container(
                        height: 200,
                        alignment: Alignment.center,
                        child: const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.white),
                        ),
                      ),
                    );
                  }else{
                    return SliverToBoxAdapter(
                      child: StaggeredGrid.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 1,
                        crossAxisSpacing: 1,
                        children: snapshot.data!.docs.map((doc) => StaggeredGridTile.count(
                          crossAxisCellCount: doc["x"],
                          mainAxisCellCount: doc["y"],
                          child: FadeInImage.memoryNetwork(
                              placeholder: kTransparentImage,
                              image: doc["image"],
                              fit: BoxFit.cover,
                          ),
                        )).toList(),
                      ),
                    );
                  }
                })
          ],
        )
      ],
    );
  }
}
