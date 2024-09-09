import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../model/product.dart';
part 'cart_provider.g.dart';

@riverpod
class CartNotifier extends _$CartNotifier{
  @override
  Map<Product, int> build() {
    return {};
  }

  void addToCart(Product item) {
    if (state.containsKey(item)) {
      Map<Product, int> curr = state;
      curr[item] = curr[item]! + 1;
      state = curr;
      ref.notifyListeners();
    } else {
      state = {
        ...state,
        item: 1
      };
    }
  }

    void addItem(Product item){
      Map<Product,int> curr = state;
      curr[item]=curr[item]!+1;
      state=curr;
      ref.notifyListeners();
    }

    void removeItem(Product item){
      if(state[item]! ==1){
        state.remove(item);
        ref.notifyListeners();
      }
      else{
        Map<Product,int> curr = state;
        curr[item]=curr[item]!-1;
        state=curr;
        ref.notifyListeners();
      }
    }
  }




