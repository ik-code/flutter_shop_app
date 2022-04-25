import 'package:flutter/material.dart';
import 'package:flutter_shop_app/widgets/app_drawer.dart';
import 'package:provider/provider.dart';

import '../providers/orders_provider.dart';
import '../widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {

  static const routeName = '/orders';

  const OrdersScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<OrdersProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
        ),
        drawer: const AppDrawer(),
        body:  ListView.builder(
          itemCount: orderData.orders.length,
          itemBuilder: (context, i) => OrderItemItem(
            orderData.orders[i],
          ),
          ),
    );
  }
}