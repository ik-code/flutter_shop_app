import 'package:flutter/material.dart';

import './screens/products_overview_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Shop App',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: ProductOverviewScreeen(),
    );
  }
}
