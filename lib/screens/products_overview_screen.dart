import 'package:flutter/material.dart';

import '../widgets/products_grid.dart';

enum FilterOptions {
  favorites,
  all,
}

class ProductOverviewScreeen extends StatefulWidget {
  const ProductOverviewScreeen({Key? key}) : super(key: key);

  @override
  State<ProductOverviewScreeen> createState() => _ProductOverviewScreeenState();
}

class _ProductOverviewScreeenState extends State<ProductOverviewScreeen> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Awesome Shop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.favorites) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
            icon: const Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => [
              const PopupMenuItem(
                child: Text('Only Favorites'),
                value: FilterOptions.favorites,
              ),
              const PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptions.all,
              ),
            ],
          ),
        ],
      ),
      body: ProductsGrid(_showOnlyFavorites),
    );
  }
}
