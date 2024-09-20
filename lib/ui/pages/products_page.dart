import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loja/data/product_data.dart';

import '../widgets/product_card.dart';

class ProductsPage extends StatelessWidget {

  final DocumentSnapshot? snapshot;

  const ProductsPage({super.key, this.snapshot});

  @override
  Widget build(BuildContext context) {

    final data = (snapshot?.data()) as Map<String, dynamic>;

    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(data["title"]),
            centerTitle: true,
            bottom: const TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(icon: Icon(Icons.grid_on),),
                Tab(icon: Icon(Icons.list),),
              ],
            ),
          ),
          body: FutureBuilder<QuerySnapshot>(
            future: FirebaseFirestore.instance
                .collection("products")
                .doc(snapshot?.id)
                .collection("items").get(),
            builder: (context, snapshot){
              if(!snapshot.hasData){
                return const Center(child: CircularProgressIndicator());
              }else{
                return TabBarView(
                  children: [
                    GridView.builder(
                      padding: const EdgeInsets.all(4),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 4,
                          crossAxisSpacing: 4,
                          childAspectRatio: 0.65
                        ),
                        itemCount: snapshot.data?.docs.length,
                        itemBuilder: (context, index){
                            return ProductCard(type: "grid", snapshot: ProductData.fromDocument(snapshot.data?.docs[index] as DocumentSnapshot));
                        }
                    ),
                    ListView.builder(
                        padding: const EdgeInsets.all(4),
                        itemCount: snapshot.data?.docs.length,
                        itemBuilder: (context, index){
                          return ProductCard(type: "list", snapshot: ProductData.fromDocument(snapshot.data?.docs[index] as DocumentSnapshot));
                        }
                    )
                  ],
                );
              }
            },
          )
        )
    );
  }
}
