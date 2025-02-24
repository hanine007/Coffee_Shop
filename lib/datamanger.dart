import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myapp/datamodel.dart';

class Datamanger {
  List<Category>? _menu;
  List<ItemClass> cart = [];

  Future<void> fetchmenu() async {
    const url = "https://firtman.github.io/coffeemasters/api/menu.json";
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body) as List<dynamic>;
        _menu = decodedData.map((json) => Category.fromJson(json)).toList();
      } else {
        throw Exception("Échec du chargement du menu : ${response.statusCode}");
      }
    } catch (e) {
      print("Erreur lors du chargement du menu : $e");
    }
  }

  Future<List<Category>> getmenu() async {
    if (_menu == null) {
      await fetchmenu();
    }
    return _menu ?? []; // Évite de retourner null
  }

  void cartadd(Product p) {
    bool found = false;
    for (var item in cart) {
      if (item.product.id == p.id) {
        item.quantity++;
        found = true;
        break;
      }
    }
    if (!found) {
      cart.add(ItemClass(product: p, quantity: 1));
    }
  }

  void cartremove(Product p) {
    cart.removeWhere((item) => item.product.id == p.id);
  }

  void cartclear() {
    cart.clear();
  }

  double cartTotal() {
    return cart.fold(
      0.0,
      (total, item) => total + (item.quantity * item.product.price),
    );
  }
}
