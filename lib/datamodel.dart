class Product {
  String name;
  int id;
  double price;
  String image;
  String get imageurl =>
      "https://firtman.github.io/coffeemasters/api/images/coffee/$image";
  Product({
    required this.name,
    required this.id,
    required this.price,
    required this.image,
  });
  // Convertit une Map en objet Product
    factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'] as int,
        name: json['name'] as String,
        price: json['price'] as double,
        image: json['image'] as String);
  }

}

class Category {
  String name;
  List<Product> products; // Liste des produits associés à la catégorie
  Category({required this.name, required this.products});
 factory Category.fromJson(Map<String, dynamic> json) {
    var productsJson = json['products'] as Iterable<dynamic>;
    var products = productsJson.map((p) => Product.fromJson(p)).toList();
    return Category(name: json['name'] as String, products: products);
  }
}

class ItemClass {
  Product product; // Produit associé à l'élément
  int quantity;
  ItemClass({required this.product, required this.quantity});
}
