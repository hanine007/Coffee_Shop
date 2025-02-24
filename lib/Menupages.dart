import 'package:flutter/material.dart';
import 'package:myapp/datamodel.dart';

class Menupages extends StatelessWidget {
  const Menupages({super.key});

  @override
  Widget build(BuildContext context) {
    var p = Product(name: "Coffee", id: 1, price: 35, image: "");
    var q = Product(name: "Coffee Simple", id: 2, price: 20, image: "");

    return ListView(
      children: [
        ProductItem(product: p, onAdd: () {}),
        ProductItem(product: q, onAdd: () {}),
      ],
    );
  }
}

class ProductItem extends StatelessWidget {
  final Product product;
  final Function onAdd;
  const ProductItem({super.key, required this.product, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Card(
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("images/black_coffee.png"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        product.name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("\$${product.price}"),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    onAdd(product);
                  },
                  child: Text("Add"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
