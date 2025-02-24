import 'package:flutter/material.dart';
import 'package:myapp/datamanger.dart';
import 'package:myapp/datamodel.dart';

class orderpages extends StatefulWidget {
  final Datamanger datamanger;

  const orderpages({super.key, required this.datamanger});

  @override
  State<orderpages> createState() => _orderpagesState();
}

class _orderpagesState extends State<orderpages> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.datamanger.cart.length,
      itemBuilder: (context, index) {
        var item = widget.datamanger.cart[index];
        return OrderItem(
          item: item,
          onRemove: (product) {
            setState(() {
            widget.datamanger.cartremove(product);
            });
          },
        );
      },
    );
  }
}

class OrderItem extends StatelessWidget {
  final ItemClass item;
  final Function onRemove;
  const OrderItem({Key? key, required this.item, required this.onRemove})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text("${item.quantity}x"),
              ),
            ),
            Expanded(
              flex: 6,
              child: Text(
                item.product.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                "\$" + (item.product.price * item.quantity).toStringAsFixed(2),
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  onRemove(item.product);
                },
                icon: const Icon(Icons.delete),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
