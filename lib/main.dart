import 'package:flutter/material.dart';
import 'package:flutter_shop_app/providers/cart_provider.dart';
import 'package:flutter_shop_app/screens/product_detail_screen.dart';
import 'package:provider/provider.dart';

import './screens/products_overview_screen.dart';

import './providers/products_provider.dart';

void main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
      ChangeNotifierProvider.value(
      value: ProductsProvider(),
      ),
       ChangeNotifierProvider.value(
      value: CartProvider() ,),
    ], 
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Shop App',
        theme: ThemeData(
          primarySwatch: Colors.brown,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato'
        ),
        home:  const ProductOverviewScreeen(),
        routes: {
          ProductDetailScreen.routeName:(context) => const ProductDetailScreen(),
    
        },
      ),
    );
  }
}

