// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:my_shop/providers/products.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String title;
  // final String id;

  // ProductDetailScreen(this.title, this.id);
  static const routePath = './product-detail';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final loadedProduct = Provider.of<Products>(context, listen: false)
        // listen == false would rebuild this widget one time
        .items
        .firstWhere((prod) => prod.id == productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
      body: Image.network(loadedProduct.imageUrl),
    );
  }
}
