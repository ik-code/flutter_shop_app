import 'package:flutter/material.dart';
import 'package:flutter_shop_app/screens/cart_screen.dart';
import 'package:flutter_shop_app/widgets/app_drawer.dart';
import 'package:provider/provider.dart';

import '../widgets/products_grid.dart';
import '../widgets/badge.dart';
import 'package:flutter_shop_app/providers/cart_provider.dart';

import '../providers/products_provider.dart';

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

//for didChangeDependencies approach
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    // Perfect scenario for fetch data
    // Provider.of<ProductsProvider>(context).fetchAndSetProduct(); // WONT'T WORK!

    // This would work but it's kind of a hack, though you can absolutely also
    // use this approach.
    // Future.delayed(Duration.zero).then((_) {
    //   Provider.of<ProductsProvider>(context).fetchAndSetProduct();
    // });
    //ModalRoute.of(context)
    super.initState();
  }

  //other approach
  // When using this approach, you should have another helper variable or property
  // like isInit
  @override
  void didChangeDependencies() {
    if (_isInit) {

      setState(() {
        //update the UI
             _isLoading = true;
            
      });

 
      // don't use async await here but here, I will use the old approch with then
      Provider.of<ProductsProvider>(context).fetchAndSetProduct().then((_) {

        setState(() {
            _isLoading = false;
        });

      });
      //it's working.Look at DEBUG CONSOLE We get a printed Response from Server Firebase
    }

    // That this never runs again
    _isInit = false;
    super.didChangeDependencies();
  }

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
          Consumer<CartProvider>(
            builder: (_, cart, ch) => Badge(
              child: ch!,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: _isLoading
      ? Center(child: CircularProgressIndicator(),)
      : ProductsGrid(_showOnlyFavorites),
    );
  }
}
