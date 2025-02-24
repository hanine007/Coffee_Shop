// import 'package:flutter/material.dart';
// import 'package:myapp/datamanger.dart';
// import 'package:myapp/datamodel.dart';

// class Menupages extends StatelessWidget {
//   final Datamanger datamanger;
//   const Menupages({super.key, required this.datamanger});

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: datamanger.getmenu(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Center(child: Text("There was an error"));
//         } else if (snapshot.hasData) {
//           var categories = snapshot.data! as List<Category>;

//           return ListView.builder(
//             itemCount: categories.length,
//             itemBuilder: (context, index) {
//               var category = categories[index];

//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(12.0),
//                     child: Text(
//                       category.name,
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.blueAccent,
//                       ),
//                     ),
//                   ),
//                   if (category
//                       .products
//                       .isNotEmpty) // Vérifie s'il y a des produits
//                     ListView.builder(
//                       shrinkWrap: true,
//                       physics:
//                           NeverScrollableScrollPhysics(), // Empêche le défilement
//                       itemCount: category.products.length,
//                       itemBuilder: (context, prodindex) {
//                         var product = category.products[prodindex];
//                         return ProductItem(
//                           product: product,
//                           onAdd: (addedProduct) {
//                             datamanger.cartadd(addedProduct);
//                           },
//                         );
//                       },
//                     )
//                   else
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text("Aucun produit disponible"),
//                     ),
//                 ],
//               );
//             },
//           );
//         } else {
//           return Center(child: Text("No data available"));
//         }
//       },
//     );
//   }
// }

// class ProductItem extends StatelessWidget {
//   final Product product;
//   final Function(Product) onAdd;
//   const ProductItem({super.key, required this.product, required this.onAdd});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//       padding: EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8),
//         boxShadow: [
//           BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 2),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Image.network(
//             product.imageurl,
//             height: 150,
//             width: double.infinity,
//             fit: BoxFit.cover,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               product.name,
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//             child: Text(
//               "\$${product.price}",
//               style: TextStyle(color: Colors.green, fontSize: 14),
//             ),
//           ),
//           Align(
//             alignment: Alignment.centerRight,
//             child: ElevatedButton(
//               onPressed: () {
//                 onAdd(product);
//               },
//               child: Text("Add"),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

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
                        onAdd: (p) {
                          datamanger.cartadd(p);
                        },
                      );
                    },
                  ),
                ],
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text("There was an error");
        } else {
          return CircularProgressIndicator();
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
