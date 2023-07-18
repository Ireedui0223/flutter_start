import 'package:flutter/material.dart';
import 'package:flutter_start/datamanager.dart';
import 'package:flutter_start/datamodel.dart';

class OrderPage extends StatefulWidget {
  final DataManager dataManager;

  const OrderPage({super.key, required this.dataManager});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    if (widget.dataManager.card.isEmpty) {
      return const Text("No data found");
    } else {
      return ListView.builder(
          itemCount: widget.dataManager.card.length,
          itemBuilder: (context, index) {
            var item = widget.dataManager.card[index];
            return OrderItem(
                item: item,
                onRemove: (product) {
                  setState(() {
                    widget.dataManager.cardRemove(product);
                  });
                });
          });
    }
  }
}

class OrderItem extends StatelessWidget {
  final ItemInCart item;
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
                )),
            Expanded(
                flex: 6,
                child: Text(
                  item.product.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )),
            Expanded(
                flex: 2,
                child: Text(
                    "\$${(item.product.price * item.quantity).toStringAsFixed(2)}")),
            Expanded(
                flex: 1,
                child: IconButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      onRemove(item.product);
                    },
                    icon: const Icon(Icons.delete)))
          ],
        ),
      ),
    );
  }
}
