import 'package:flutter/material.dart';
import 'package:loja/data/product_data.dart';

import '../pages/product_detail_page.dart';

class ProductCard extends StatelessWidget {
  final String? type;
  final ProductData? snapshot;

  const ProductCard({super.key, this.type, this.snapshot});

  @override
  Widget build(BuildContext context) {
    final data = snapshot!.toMap();

    return InkWell(
      child: Card(
        child: type == "grid"
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AspectRatio(
                      aspectRatio: 0.8,
                      child: Image.network(
                        snapshot!.images?[0],
                        fit: BoxFit.cover,
                      )),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Text(
                            data['title'],
                            style: const TextStyle(fontWeight: FontWeight.w700),
                          ),
                          Text(data['price']?.toStringAsFixed(2) ??
                              'Unknown price'),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            : Row(
          children: [
            Flexible(
              flex: 1,
                child: Image.network(
                  snapshot!.images?[0],
                  fit: BoxFit.cover,
                  height: 250,
                  width: 250,
                )),
            Flexible(
              flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['title'],
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                      Text(data['price']?.toStringAsFixed(2) ??
                          'Unknown price'),
                    ],
                  ),
                ),
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ProductDetailPage(data: snapshot))
        );
      },
    );
  }
}
