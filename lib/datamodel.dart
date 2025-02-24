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
}

class Category {
  String name;
  List<Product> products; // Liste des produits associés à la catégorie
  Category({required this.name, required this.products});
}

class ItemClass {
  Product product; // Produit associé à l'élément
  int quantity;
  ItemClass({required this.product, required this.quantity});
}
