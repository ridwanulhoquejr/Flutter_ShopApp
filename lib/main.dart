// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:my_shop/screens/product_details_screen.dart';
import 'package:my_shop/screens/products_overview_screen.dart';

import 'package:provider/provider.dart';

import 'providers/products.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // Provider
      create: (ctx) => Products(),
      // Allows us to register a Class, so that we can listen this class in child widget
      child: MaterialApp(
        title: 'My Shop',
        theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato'),
        home: ProductOverviewScreen(),
        routes: {
          ProductDetailScreen.routePath: (ctx) => ProductDetailScreen(),
        },
      ),
    );
  }
}
