import 'package:cloud_firestore/cloud_firestore.dart';

class ProductData {
  String? id;
  String? category;
  String? title;
  String? description;
  double? price;
  List? images;
  List? sizes;

  ProductData.fromDocument(DocumentSnapshot snapshot) {

    final data = (snapshot.data()) as Map<String, dynamic>;

    id = snapshot.id;
    title = data['title'];
    description = data['description'];
    price = data['price']?.toDouble();
    images = data['images'];
    sizes = data['sizes'];
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "category": category,
      "title": title,
      "description": description,
      "price": price,
      "images": images,
      "sizes": sizes,
    };
  }

}