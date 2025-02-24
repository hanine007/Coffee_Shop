import 'package:myapp/datamodel.dart';

class Datamanger {
  List<Category>? _menu; // Liste pouvant être null

  List<ItemClass> cart = [];
  cartadd(Product p) {
    bool found = false;
    for (var item in cart) {
      if (item.product.id == p.id) {
        item.quantity++;
        found = true;
      }
      if (!found) {
        // Si l'élément n'a pas été trouvé
        cart.add(ItemClass(product: p, quantity: 1)); // Ajoute un élément
      }
    }
  }

  cartremove(Product p) {
    cart.removeWhere((item) => item.product.id == p.id);
  }

  cartclear() {
    cart.clear();
  }

  double cartTotal() {
    var total = 0.0;
    for (var item in cart) {
      total += item.quantity * item.product.price;
    }
    return total;
  }
}
