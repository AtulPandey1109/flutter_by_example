import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/product.dart';


class CartNotifier extends Notifier<Map<Product,int>>{
  @override
  Map<Product, int> build() {
    return {};
  }

  void addToCart(Product item){
    if(state.containsKey(item)){
      Map<Product,int> curr = state;
      curr[item]=curr[item]!+1;
      state=curr;
    }else{
      state={
        ...state,
        item:1
      };
    }
  }
}

final cartNotifierProvider = NotifierProvider<CartNotifier,Map<Product,int>>((){
  return CartNotifier();
});