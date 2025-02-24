import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:myapp/datamodel.dart';

class Datamanger {
  List<Category>? _menu; // Liste pouvant être null

  List<ItemClass> cart = [];
  fetchmenu() async {
    const url = "https://firtman.github.io/coffeemasters/api/menu.json";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      _menu = [];
      var decodedData = jsonDecode(response.body) as List<dynamic>;
      for (var json in decodedData) {
        _menu?.add(Category.fromJson(json));
      }
    }
  }

  Future<List<Category>> getmenu() async {
    if (_menu == null) {
      fetchmenu();
    }
    return _menu!;
  }

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
