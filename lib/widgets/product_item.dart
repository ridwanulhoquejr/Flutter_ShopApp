// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:my_shop/providers/product.dart';
import 'package:my_shop/screens/product_details_screen.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    return GridTile(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed(ProductDetailScreen.routePath, arguments: product.id);
        },
        child: Image.network(
          product.imageUrl,
          fit: BoxFit.cover,
        ),
      ),
      header: Text(product.title),
      footer: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            // Consumer is a efficient way of Listening (Provider.of() shortcut but efficient)
            builder: (ctx, product, _) => IconButton(
              icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border),
              onPressed: () {
                product.togglefav();
              },
              color: Theme.of(context).accentColor,
            ),
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
