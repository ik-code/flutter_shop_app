import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../providers/orders_provider.dart' as ord;

class OrderItemItem extends StatelessWidget {
  final ord.OrderItem order;
  

  const OrderItemItem(this.order, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10), child: Column(children: <Widget>[
        ListTile(
          title: Text('\$${order.amount}'),
          subtitle: Text(
            DateFormat('dd/MM/yyyy hh:mm').format(order.dateTime),
            ),
            trailing: IconButton(
              icon: Icon(Icons.expand_more), 
              onPressed: () {

            },
            ),
            
        )
      ],),
    );
  }
}
