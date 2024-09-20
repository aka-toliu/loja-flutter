import 'package:flutter/material.dart';
import 'package:loja/data/product_data.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';


class ProductDetailPage extends StatefulWidget {

  final ProductData? data;

  const ProductDetailPage({super.key, this.data});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState(data);
}

class _ProductDetailPageState extends State<ProductDetailPage> {

  final ProductData? data;

  _ProductDetailPageState(this.data);

  @override
  Widget build(BuildContext context) {

    final product = data!.toMap();
    final Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: Text(product["title"]),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          AspectRatio(
              aspectRatio: 0.9,
            child: AnotherCarousel(
              images: product["images"].map((url){
                return NetworkImage(url);
              }).toList(),
              dotSize: 4,
              dotSpacing: 15,
              dotBgColor: Colors.transparent,
              dotColor: primaryColor,
              autoplay: false,
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(product["title"], style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 22), maxLines: 3,),
                Text("R\$ ${product["price"].toStringAsFixed(2)} ", style: const TextStyle(fontSize: 24),),
                const SizedBox(height: 16,),
                const Text("Tamanho", style: TextStyle(fontSize: 16),),
                SizedBox(
                  height: 34,
                  child: GridView(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    scrollDirection: Axis.horizontal,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 8,
                      childAspectRatio: 0.5,
                    ),
                    children: data!.sizes!.map(
                        (s){
                          return GestureDetector(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                                  border: Border.all(
                                    color: Colors.grey
                                  )
                                ),
                                width: 50,
                                alignment: Alignment.center,
                                child: s is String ? Text(s) : Text('Unknown Size'),
                              ),
                          );
                        }
                    ).toList(),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
