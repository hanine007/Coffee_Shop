import 'package:flutter/material.dart';
import 'package:myapp/datamanger.dart';
import 'package:myapp/datamodel.dart';

class Menupages extends StatelessWidget {
  final Datamanger datamanger;
  const Menupages({super.key, required this.datamanger});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: datamanger.getmenu(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var categories = snapshot.data! as List<Category>;
          return ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(categories[index].name),
                  ),
                  ListView.builder(
                    shrinkWrap: true, // Permet de scroller
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: categories[index].products.length,
                    itemBuilder: (context, prodindex) {
                      var product = categories[index].products[prodindex];
                      return ProductItem(
                        product: product,
                        onAdd: () {
                          datamanger.cartadd(product);
                        },
                      );
                    },
                  ),
                ],
              );
            },
          );
        } else if (snapshot.hasError) {
          return const Text("There was an error");
        } else {
          return const CircularProgressIndicator();
        }
      },
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
            //Image.asset("images/black_coffee.png"),
            Image.network(product.imageurl),
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
