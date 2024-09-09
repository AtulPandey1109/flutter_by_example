import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_login_app/riverpod_example/providers/cart_provider.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartNotifierProvider);
    int amount = 0;
    for (var item in cart.entries) {
      final product = item.key;
      final qty = item.value;
      amount = amount + (int.parse(product.price) * qty);
    }
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
          title: const Text("My Cart"),
        ),
        body: cart.isEmpty
            ? const Center(child: Text("Your cart is empty"))
            : Column(
                children: [
                  Expanded(
                    child: ListView(

                      children: cart.entries.map((data) {
                        final product = data.key;
                        final quantity = data.value;
                        return ListTile(

                          leading: Icon(product.productIcon),
                          title: Padding(
                            padding: const EdgeInsets.only(left: 24),
                            child: Text(product.name),
                          ),
                          trailing: Text(product.price),
                          subtitle: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    ref
                                        .read(cartNotifierProvider.notifier)
                                        .removeItem(data.key);
                                  },
                                  icon: const Icon(
                                    Icons.remove,
                                    size: 14,
                                  )),
                              Text(
                                '$quantity',
                                style: TextStyle(fontSize: 14),
                              ),
                              IconButton(
                                  onPressed: () {
                                    ref
                                        .read(cartNotifierProvider.notifier)
                                        .addItem(data.key);
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                    size: 14,
                                  )),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(4, 10, 4, 20),
                    child: ListTile(
                      title: const Text('Total'),
                      trailing: Text('Rs. $amount'),
                    ),
                  )
                ],
              ));
  }
}
