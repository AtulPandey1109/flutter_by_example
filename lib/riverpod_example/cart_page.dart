import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_login_app/riverpod_example/providers/cart_provider.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final cart = ref.read(cartNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back)),
        title: const Text("My Cart"),
      ),
      body: cart.isEmpty
          ? const Center(child: Text("Your cart is empty"))
          :ListView(
        children: cart.entries.map((data){
          final product = data.key;
          final quantity = data.value;
          return ListTile(
            leading: Icon(product.productIcon),
            title: Text(product.name),
            trailing: Text(product.price),
            subtitle: Text('$quantity'),
          );
        }).toList(),
      )
    );
  }
}
