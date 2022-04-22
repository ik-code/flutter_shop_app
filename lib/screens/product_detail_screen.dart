import 'package:flutter/material.dart';

import 'package:flutter_shop_app/providers/products_provider.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String title;
  // final double price;

  // ProductDetailScreen(this.title, this.price);
  static const routeName = '/product-detail';

  const ProductDetailScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context)!.settings.arguments as String; // is the id!

    final loadedProduct = Provider.of<ProductsProvider>(
      context, 
      listen: false, //only if product is changed widget will be  updated
      ).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
    );
  }
}
