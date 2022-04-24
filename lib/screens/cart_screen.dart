import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_shop_app/providers/cart_provider.dart';
import '../widgets/cart_item_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {

    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const Spacer(),
                  Chip(
                    label: Text( 
                      cart.totalAmount.toString(),
                      style: const TextStyle( color: Colors.white), ),
                    backgroundColor: Theme.of(context).primaryColor,
                    ),
                    FlatButton(
                      onPressed: () {

                    }, 
                    child: const Text(
                      'Order Now'
                      ),
                      textColor: Theme.of(context).primaryColor,
                    )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cart.items.length, 
                itemBuilder: (ctx, i) => CartItemItem(
                  id: cart.items.values.toList()[i].id, 
                  title: cart.items.values.toList()[i].title, 
                  quantity: cart.items.values.toList()[i].quantity, 
                  price: cart.items.values.toList()[i].price,
                ), 
                ),
            ),
        ],
      ),
    );
  }
}
