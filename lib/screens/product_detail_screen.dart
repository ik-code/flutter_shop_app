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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height:300,
              child: Image.network(
                loadedProduct.imageUrl,
                fit: BoxFit.cover,
                ), 
              ),
              const SizedBox(
                height: 10
              ),
              Text(
                '\$${loadedProduct.price}',
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  child: Text(
                    loadedProduct.description,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    ),
                ),
          ],
        ),
      ),
    );
  }
}
