import 'package:my_login_app/riverpod_example/model/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'product_provider.g.dart';

List<Product> allProducts = Product.productData();

@riverpod
List<Product> products(ref) {
  return allProducts;
}