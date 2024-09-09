import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_login_app/riverpod_example/cart_page.dart';
import 'package:my_login_app/riverpod_example/model/product.dart';
import 'package:my_login_app/riverpod_example/providers/cart_provider.dart';
import 'package:my_login_app/riverpod_example/providers/product_provider.dart';

class RiverPodExample extends ConsumerWidget {
  const RiverPodExample({super.key});
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final products = ref.watch(productsProvider);
    int quantity =0;
    final cart = ref.watch(cartNotifierProvider);
    for(var item in cart.entries){
      final qty =  item.value;
      quantity = quantity+ qty;
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text("RiverPod Example"),
        actions: [
          Stack(
            children: [
              IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const CartPage()));
              }, icon: const Icon(Icons.shopping_cart)),
               Positioned(
                left: 5,
                  top: 5,
                  child: CircleAvatar(
                radius: 8,
                child: Text('$quantity',style: const TextStyle(fontSize: 8),),
              ))
            ],
          )
        ],
      ),
      body: GridView.builder(
        physics: const ClampingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            Product item = products[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      item.productIcon,
                      size: 60,
                    ),
                    Text(item.name),
                    Text('Rs. ${item.price}'),
                    ElevatedButton(onPressed: (){
                      ref.read(cartNotifierProvider.notifier).addToCart(item);
                    }, child: const Text('Add to cart'))
                  ],
                ),
              ),
            );
          },
        itemCount: products.length,

          ),
    );
  }
}
