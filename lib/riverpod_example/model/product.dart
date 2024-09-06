import 'package:flutter/material.dart';

class Product{
  final String name;
  final String price;
  final IconData productIcon;

  const Product(this.name, this.price, this.productIcon);
  static List<Product> productData(){
    return [
      const Product('Earphone', '2500', Icons.earbuds),
      const Product('Mobile', '10000', Icons.mobile_screen_share),
      const Product('Clock', '1200', Icons.access_alarm),
      const Product('Wallet', '540', Icons.account_balance_wallet),
      const Product('Bag', '799', Icons.backpack),
      const Product('Cake', '700', Icons.cake),
      const Product('Bike', '50000', Icons.electric_bike),
      const Product('Memory Card', '650', Icons.save_outlined),
      const Product('Car', '1000000', Icons.drive_eta),
    ];
  }
}