import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {

  final DocumentSnapshot? snapshot;

  const ProductTile({super.key, this.snapshot});

  @override
  Widget build(BuildContext context) {

    final data = snapshot?.data() as Map<String, dynamic>;

    return ListTile(
      minTileHeight: 80,
      leading: CircleAvatar(
      radius: 25,
      backgroundImage: NetworkImage(data["icon"]),
    ),
      title: Text(data["title"]),
      trailing: const Icon(Icons.keyboard_arrow_right),
      onTap: (){},
    );
  }
}
