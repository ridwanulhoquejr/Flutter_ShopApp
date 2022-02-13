// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import '../widgets/product_grid.dart';

enum FilterOptions {
  favorites,
  all,
}

class ProductOverviewScreen extends StatefulWidget {
  ProductOverviewScreen();

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  // we will re-rendered this widget when _showfavs are toggled! so this var will help us to do so.
  // Then we will pass this variable to widget where products will be displayed
  var _showFavs = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_horiz),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('favorite'),
                value: FilterOptions.favorites,
              ),
              PopupMenuItem(
                child: Text('all products'),
                value: FilterOptions.all,
              ),
            ],
            onSelected: (FilterOptions selectedValue) {
              setState(
                () {
                  if (selectedValue == FilterOptions.favorites) {
                    _showFavs = true;
                  } else {
                    _showFavs = false;
                  }
                },
              );
            },
          )
        ],
      ),
      body: ProductsGrid(_showFavs),
    );
  }
}
