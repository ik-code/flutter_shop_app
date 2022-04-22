import 'package:flutter/material.dart';

import '../widgets/product_grid.dart';


class ProductOverviewScreeen extends StatelessWidget {
  const ProductOverviewScreeen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Awesome Shop'),
      ),
      body: const ProductsGrid(),
    );
  }
}

